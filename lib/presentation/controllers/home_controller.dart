import 'dart:async';

import 'package:rd_client/utils/app_links_stub.dart'
    if (dart.library.io) 'package:app_links/app_links.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/services/sharing_intent_service.dart';
import 'package:rd_client/services/storage_service.dart';

class HomeController extends GetxController {
  RxList<Torrent> torrents = <Torrent>[].obs;
  RxBool isLoading = true.obs;

  late final ApiService apiService;
  final _appLinks = AppLinks();
  final _sharingIntentService = getSharingIntentService();
  StreamSubscription? _appLinksSubscription;
  StreamSubscription? _intentDataStreamSubscription;

  // Callbacks for navigation - set by the view
  Function(String magnetLink)? onMagnetLinkReceived;
  Function(String torrentPath)? onTorrentFileReceived;
  VoidCallback? onNavigateToSettings;

  @override
  void onInit() {
    apiService = ApiService.instance;
    _initializeDeepLinks();
    _initializeSharing();
    super.onInit();
  }

  @override
  void onClose() {
    _appLinksSubscription?.cancel();
    _intentDataStreamSubscription?.cancel();
    super.onClose();
  }

  Future<void> fetchTorrents() async {
    isLoading.value = true;
    torrents.clear();
    torrents.value = await apiService.getTorrentList();
    isLoading.value = false;
  }

  Future<bool> checkApiToken() async {
    final token = await StorageService.instance.getToken();
    return token != null;
  }

  void _initializeDeepLinks() {
    _appLinksSubscription = _appLinks.uriLinkStream.listen((uri) {
      if (uri.scheme == 'magnet' && onMagnetLinkReceived != null) {
        onMagnetLinkReceived!(uri.toString());
      }
    });
  }

  void _initializeSharing() {
    // Handle initial shared media when app starts
    _sharingIntentService.getInitialFiles().then((files) {
      if (files.isNotEmpty) {
        _handleSharedFiles(files);
      }
    });

    // Handle shared media while app is in foreground
    _intentDataStreamSubscription = _sharingIntentService.getFileStream().listen(
      (files) {
        _handleSharedFiles(files);
      },
      onError: (err) {
        throw Exception('getMediaStream error: $err');
      },
    );
  }

  void _handleSharedFiles(List<SharedFile> files) {
    for (var file in files) {
      if (file.path.endsWith(".torrent") && onTorrentFileReceived != null) {
        onTorrentFileReceived!(file.path);
      }
    }
  }
}
