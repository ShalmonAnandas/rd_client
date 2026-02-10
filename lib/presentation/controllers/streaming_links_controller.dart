import 'package:get/get.dart';
import 'package:rd_client/models/torrentio_stream_model.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/utils/app_constants.dart';

class StreamingLinksController extends GetxController {
  final String mediaType;
  final String imdbId;
  final int? season;
  final int? episode;

  StreamingLinksController({
    required this.mediaType,
    required this.imdbId,
    this.season,
    this.episode,
  });

  final RxList<TorrentioStream> streams = <TorrentioStream>[].obs;
  final RxList<TorrentioStream> rdStreams = <TorrentioStream>[].obs;
  final RxList<TorrentioStream> torboxStreams = <TorrentioStream>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isRdLoading = true.obs;
  final RxBool isTorboxLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadStreams();
  }

  Future<void> loadStreams() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      streams.clear();
      rdStreams.clear();
      torboxStreams.clear();

      final futures = <Future>[];
      final streamType = mediaType == 'tv' ? 'series' : 'movie';

      if (AppConstants.hasRdToken) {
        isRdLoading.value = true;
        futures.add(
          ApiService.instance
              .getTorrentioStreams(
                mediaType: streamType,
                imdbId: imdbId,
                season: season,
                episode: episode,
                provider: AppConstants.realDebridProvider,
              )
              .then((response) {
            if (response.streams != null) {
              rdStreams.value = response.streams!;
            }
            isRdLoading.value = false;
          }).catchError((e) {
            isRdLoading.value = false;
          }),
        );
      } else {
        isRdLoading.value = false;
      }

      if (AppConstants.hasTorboxToken) {
        isTorboxLoading.value = true;
        futures.add(
          ApiService.instance
              .getTorrentioStreams(
                mediaType: streamType,
                imdbId: imdbId,
                season: season,
                episode: episode,
                provider: AppConstants.torboxProvider,
              )
              .then((response) {
            if (response.streams != null) {
              torboxStreams.value = response.streams!;
            }
            isTorboxLoading.value = false;
          }).catchError((e) {
            isTorboxLoading.value = false;
          }),
        );
      } else {
        isTorboxLoading.value = false;
      }

      await Future.wait(futures);
      streams.value = [...rdStreams, ...torboxStreams];

      if (streams.isEmpty &&
          rdStreams.isEmpty &&
          torboxStreams.isEmpty) {
        // Only set error if no streams from any provider
      }
    } catch (e) {
      errorMessage.value = 'Failed to load streams: $e';
      streams.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
