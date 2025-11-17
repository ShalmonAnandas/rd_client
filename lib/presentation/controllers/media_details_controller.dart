import 'package:get/get.dart';
import 'package:rd_client/models/media_details_model.dart';
import 'package:rd_client/models/season_model.dart';
import 'package:rd_client/services/api_service.dart';

class MediaDetailsController extends GetxController {
  final String mediaType;
  final int mediaId;

  MediaDetailsController({required this.mediaType, required this.mediaId});

  final Rxn<MediaDetailsModel> mediaDetails = Rxn<MediaDetailsModel>();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxMap<int, SeasonModel> seasonsData = <int, SeasonModel>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadMediaDetails();
  }

  Future<void> loadMediaDetails() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final details = await ApiService.instance.getMediaDetails(
        mediaType: mediaType,
        mediaId: mediaId,
      );

      mediaDetails.value = details;
    } catch (e) {
      errorMessage.value = 'Failed to load media details: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadSeasonDetails(int seasonNumber) async {
    // Check if already loaded
    if (seasonsData.containsKey(seasonNumber)) {
      return;
    }

    try {
      final seasonData = await ApiService.instance.getSeasonDetails(
        tvShowId: mediaId,
        seasonNumber: seasonNumber,
      );

      seasonsData[seasonNumber] = seasonData;
    } catch (e) {
      print('Failed to load season $seasonNumber: $e');
    }
  }
}
