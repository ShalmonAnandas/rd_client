import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/services/video_apps_service.dart';
import 'package:rd_client/utils/app_constants.dart';
import 'package:restart_app/restart_app.dart';

class SettingsController extends GetxController {
  final TextEditingController tokenController = TextEditingController();
  final RxBool isTokenEditable = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isVideoAppsLoading = false.obs;
  final RxList<Map<String, dynamic>> availableVideoApps =
      <Map<String, dynamic>>[].obs;
  final Rx<Map<String, dynamic>?> selectedVideoApp = Rx<Map<String, dynamic>?>(
    null,
  );

  final RxBool toRestart = false.obs;

  @override
  void onClose() {
    tokenController.dispose();
    super.onClose();
  }

  Future<void> loadToken() async {
    _setLoading(true);
    try {
      final token = await StorageService.instance.getToken();
      tokenController.text = token ?? '';
      toRestart.value = isTokenEditable.value = token == null || token.isEmpty;
    } catch (e) {
      debugPrint('Error loading token: $e');
    } finally {
      _setLoading(false);
    }
  }

  void enableTokenEditing() {
    isTokenEditable.value = true;
    tokenController.clear();
  }

  void disableTokenEditing() {
    isTokenEditable.value = false;
    loadToken();
  }

  Future<void> saveToken() async {
    if (tokenController.text.trim().isEmpty) return;

    _setLoading(true);
    try {
      await StorageService.instance.storeToken(tokenController.text.trim());
      isTokenEditable.value = false;
      if (toRestart.value) {
        Restart.restartApp(
          notificationTitle: 'Restarting App',
          notificationBody: 'Please tap here to open the app again.',
        );
      }
    } catch (e) {
      debugPrint('Error saving token: $e');
    } finally {
      _setLoading(false);
    }
  }

  void showApiCalls() {
    AppConstants.alice.showInspector();
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
}
