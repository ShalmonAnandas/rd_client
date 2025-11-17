import 'package:get/get.dart';
import 'package:rd_client/models/torrentio_stream_model.dart';
import 'package:rd_client/services/api_service.dart';

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
  final RxBool isLoading = true.obs;
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

      final response = await ApiService.instance.getTorrentioStreams(
        mediaType: mediaType == 'tv' ? 'series' : 'movie',
        imdbId: imdbId,
        season: season,
        episode: episode,
      );

      if (response.streams != null) {
        streams.value = response.streams!;
      } else {
        streams.clear();
      }
    } catch (e) {
      errorMessage.value = 'Failed to load streams: $e';
      streams.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
