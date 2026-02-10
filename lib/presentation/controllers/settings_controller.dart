import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/services/video_apps_service.dart';
import 'package:rd_client/utils/app_constants.dart';
import 'package:rd_client/utils/web_reload.dart';
import 'package:rd_client/utils/restart_app_stub.dart'
    if (dart.library.io) 'package:restart_app/restart_app.dart';

class SettingsController extends GetxController {
  final TextEditingController rdTokenController = TextEditingController();
  final TextEditingController torboxTokenController = TextEditingController();
  final RxBool isRdTokenEditable = false.obs;
  final RxBool isTorboxTokenEditable = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isVideoAppsLoading = false.obs;
  final RxList<Map<String, dynamic>> availableVideoApps =
      <Map<String, dynamic>>[].obs;
  final Rx<Map<String, dynamic>?> selectedVideoApp = Rx<Map<String, dynamic>?>(
    null,
  );

  // Keep for backward compatibility
  final RxString selectedDebridProvider = AppConstants.realDebridProvider.obs;

  // Torrentio Configuration
  final RxSet<String> selectedProviders = <String>{}.obs;
  final RxSet<String> selectedQualities = <String>{}.obs;
  final RxString selectedSort = 'quality'.obs;
  final RxString selectedLanguage = ''.obs;
  final RxSet<String> selectedExclusions = <String>{}.obs;

  final RxBool toRestart = false.obs;

  // Convenience getters for backward compatibility
  TextEditingController get tokenController {
    if (selectedDebridProvider.value == AppConstants.torboxProvider) {
      return torboxTokenController;
    }
    return rdTokenController;
  }

  RxBool get isTokenEditable {
    if (selectedDebridProvider.value == AppConstants.torboxProvider) {
      return isTorboxTokenEditable;
    }
    return isRdTokenEditable;
  }

  @override
  void onInit() {
    super.onInit();
    loadTorrentioConfig();
  }

  @override
  void onClose() {
    rdTokenController.dispose();
    torboxTokenController.dispose();
    super.onClose();
  }

  String get debridDisplayName =>
      AppConstants.debridProviderLabels[selectedDebridProvider.value] ??
      'Real Debrid';

  Future<void> loadDebridProvider() async {
    final provider =
        await StorageService.instance.getDebridProvider() ??
        AppConstants.realDebridProvider;
    selectedDebridProvider.value = provider;
    AppConstants.debridProvider = provider;
  }

  Future<void> loadToken() async {
    _setLoading(true);
    try {
      // Load both tokens
      final rdToken = await StorageService.instance.getToken();
      final torboxToken = await StorageService.instance.getTorboxToken();

      AppConstants.rdToken = rdToken;
      AppConstants.torboxToken = torboxToken;
      AppConstants.apiToken = AppConstants.getTokenForProvider(
        selectedDebridProvider.value,
      );

      rdTokenController.text = rdToken ?? '';
      torboxTokenController.text = torboxToken ?? '';

      isRdTokenEditable.value = rdToken == null || rdToken.isEmpty;
      isTorboxTokenEditable.value = torboxToken == null || torboxToken.isEmpty;
      toRestart.value = (rdToken == null || rdToken.isEmpty) &&
          (torboxToken == null || torboxToken.isEmpty);
    } catch (e) {
      debugPrint('Error loading token: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> setDebridProvider(String provider) async {
    if (provider == selectedDebridProvider.value) {
      return;
    }
    selectedDebridProvider.value = provider;
    AppConstants.debridProvider = provider;
    AppConstants.apiToken = AppConstants.getTokenForProvider(provider);
    await StorageService.instance.storeDebridProvider(provider);
  }

  void enableRdTokenEditing() {
    isRdTokenEditable.value = true;
    rdTokenController.clear();
  }

  void enableTorboxTokenEditing() {
    isTorboxTokenEditable.value = true;
    torboxTokenController.clear();
  }

  void enableTokenEditing() {
    if (selectedDebridProvider.value == AppConstants.torboxProvider) {
      enableTorboxTokenEditing();
    } else {
      enableRdTokenEditing();
    }
  }

  void disableRdTokenEditing() {
    isRdTokenEditable.value = false;
    loadToken();
  }

  void disableTorboxTokenEditing() {
    isTorboxTokenEditable.value = false;
    loadToken();
  }

  void disableTokenEditing() {
    if (selectedDebridProvider.value == AppConstants.torboxProvider) {
      disableTorboxTokenEditing();
    } else {
      disableRdTokenEditing();
    }
  }

  Future<void> saveRdToken() async {
    if (rdTokenController.text.trim().isEmpty) return;

    _setLoading(true);
    try {
      await StorageService.instance.storeToken(rdTokenController.text.trim());
      AppConstants.rdToken = rdTokenController.text.trim();
      if (selectedDebridProvider.value == AppConstants.realDebridProvider) {
        AppConstants.apiToken = rdTokenController.text.trim();
      }
      isRdTokenEditable.value = false;
      _checkRestartNeeded();
    } catch (e) {
      debugPrint('Error saving RD token: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> saveTorboxToken() async {
    if (torboxTokenController.text.trim().isEmpty) return;

    _setLoading(true);
    try {
      await StorageService.instance.storeTorboxToken(
        torboxTokenController.text.trim(),
      );
      AppConstants.torboxToken = torboxTokenController.text.trim();
      if (selectedDebridProvider.value == AppConstants.torboxProvider) {
        AppConstants.apiToken = torboxTokenController.text.trim();
      }
      isTorboxTokenEditable.value = false;
      _checkRestartNeeded();
    } catch (e) {
      debugPrint('Error saving TorBox token: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> saveToken() async {
    if (selectedDebridProvider.value == AppConstants.torboxProvider) {
      await saveTorboxToken();
    } else {
      await saveRdToken();
    }
  }

  void _checkRestartNeeded() {
    final hasAnyToken = AppConstants.hasRdToken || AppConstants.hasTorboxToken;
    if (hasAnyToken && toRestart.value) {
      if (kIsWeb) {
        Get.dialog(
          AlertDialog(
            title: const Text('Refresh Required'),
            content: const Text(
              'Please refresh the page to apply the updated token.',
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Later'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  triggerWebReload();
                },
                child: const Text('Refresh now'),
              ),
            ],
          ),
        );
      } else {
        Restart.restartApp(
          notificationTitle: 'Restarting App',
          notificationBody: 'Please tap here to open the app again.',
        );
      }
    }
  }

  void showApiCalls() {
    if (!kIsWeb) {
      AppConstants.alice.showInspector();
    }
  }

  Future<void> loadVideoApps() async {
    isVideoAppsLoading.value = true;
    try {
      final apps = await VideoAppsService.getThirdPartyVideoApps();
      availableVideoApps.value = apps;

      // Load saved default video app
      final savedPackageName = await StorageService.instance
          .getDefaultVideoApp();
      if (savedPackageName != null) {
        final savedApp = apps.firstWhereOrNull(
          (app) => app['packageName'] == savedPackageName,
        );
        selectedVideoApp.value = savedApp;
      }
    } catch (e) {
      debugPrint('Error loading video apps: $e');
    } finally {
      isVideoAppsLoading.value = false;
    }
  }

  Future<void> setDefaultVideoApp(Map<String, dynamic>? app) async {
    try {
      if (app != null) {
        await StorageService.instance.storeDefaultVideoApp(app['packageName']);
        selectedVideoApp.value = app;
      } else {
        await StorageService.instance.removeDefaultVideoApp();
        selectedVideoApp.value = null;
      }
    } catch (e) {
      debugPrint('Error setting default video app: $e');
    }
  }

  void _setLoading(bool loading) {
    isLoading.value = loading;
  }

  // Torrentio Configuration Methods
  Future<void> loadTorrentioConfig() async {
    try {
      final providers = await StorageService.instance.getTorrentioProviders();
      if (providers != null && providers.isNotEmpty) {
        selectedProviders.clear();
        selectedProviders.addAll(providers.split(','));
      }

      final quality = await StorageService.instance.getTorrentioQualityFilter();
      if (quality != null && quality.isNotEmpty) {
        selectedQualities.clear();
        selectedQualities.addAll(quality.split(','));
      }

      final sort = await StorageService.instance.getTorrentioSort();
      if (sort != null) {
        selectedSort.value = sort;
      }

      final language = await StorageService.instance.getTorrentioLanguage();
      if (language != null) {
        selectedLanguage.value = language;
      }

      final exclude = await StorageService.instance.getTorrentioExclude();
      if (exclude != null && exclude.isNotEmpty) {
        selectedExclusions.clear();
        selectedExclusions.addAll(exclude.split(','));
      }
    } catch (e) {
      debugPrint('Error loading Torrentio config: $e');
    }
  }

  Future<void> toggleProvider(String provider) async {
    if (selectedProviders.contains(provider)) {
      selectedProviders.remove(provider);
    } else {
      selectedProviders.add(provider);
    }
    await StorageService.instance.storeTorrentioProviders(
      selectedProviders.join(','),
    );
  }

  Future<void> toggleQuality(String quality) async {
    if (selectedQualities.contains(quality)) {
      selectedQualities.remove(quality);
    } else {
      selectedQualities.add(quality);
    }
    await StorageService.instance.storeTorrentioQualityFilter(
      selectedQualities.join(','),
    );
  }

  Future<void> setSortOption(String sort) async {
    selectedSort.value = sort;
    await StorageService.instance.storeTorrentioSort(sort);
  }

  Future<void> setLanguage(String language) async {
    selectedLanguage.value = language;
    await StorageService.instance.storeTorrentioLanguage(language);
  }

  Future<void> toggleExclusion(String exclusion) async {
    if (selectedExclusions.contains(exclusion)) {
      selectedExclusions.remove(exclusion);
    } else {
      selectedExclusions.add(exclusion);
    }
    await StorageService.instance.storeTorrentioExclude(
      selectedExclusions.join(','),
    );
  }
}
