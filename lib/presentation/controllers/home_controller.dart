import 'dart:async';

import 'package:app_links/app_links.dart'
    if (dart.library.html) 'package:rd_client/utils/app_links_stub.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/services/sharing_intent_service.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/app_constants.dart';
import 'package:flutter/foundation.dart';

class HomeController extends GetxController {
  RxList<Torrent> torrents = <Torrent>[].obs;
  RxList<Torrent> rdTorrents = <Torrent>[].obs;
  RxList<Torrent> torboxTorrents = <Torrent>[].obs;
  RxBool isLoading = true.obs;
  RxBool isRdLoading = true.obs;
  RxBool isTorboxLoading = true.obs;

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
    rdTorrents.clear();
    torboxTorrents.clear();

    final futures = <Future>[];

    if (AppConstants.hasRdToken) {
      isRdLoading.value = true;
      futures.add(
        apiService.getTorrentList(provider: AppConstants.realDebridProvider).then(
          (list) {
            rdTorrents.value = list;
            isRdLoading.value = false;
          },
        ).catchError((e) {
          isRdLoading.value = false;
        }),
      );
    } else {
      isRdLoading.value = false;
    }

    if (AppConstants.hasTorboxToken) {
      isTorboxLoading.value = true;
      futures.add(
        apiService.getTorrentList(provider: AppConstants.torboxProvider).then(
          (list) {
            torboxTorrents.value = list;
            isTorboxLoading.value = false;
          },
        ).catchError((e) {
          isTorboxLoading.value = false;
        }),
      );
    } else {
      isTorboxLoading.value = false;
    }

    await Future.wait(futures);
    torrents.value = [...rdTorrents, ...torboxTorrents];
    isLoading.value = false;
  }

  Future<bool> checkApiToken() async {
    final rdToken = await StorageService.instance.getToken();
    final torboxToken = await StorageService.instance.getTorboxToken();
    return (rdToken != null && rdToken.isNotEmpty) ||
        (torboxToken != null && torboxToken.isNotEmpty);
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
