import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rd_client/models/media_model.dart';
import 'package:rd_client/services/api_service.dart';

class SearchController extends GetxController {
  final RxString query = ''.obs;
  final RxList<MediaModel> searchResults = <MediaModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Timer? _debounceTimer;
  final Duration debounceDuration = const Duration(milliseconds: 500);

  @override
  void onClose() {
    _debounceTimer?.cancel();
    super.onClose();
  }

  void updateQuery(String value) {
    query.value = value;
    errorMessage.value = '';

    // Cancel previous timer
    _debounceTimer?.cancel();

    if (value.trim().isEmpty) {
      searchResults.clear();
      isLoading.value = false;
      return;
    }

    // Set loading state
    isLoading.value = true;

    // Start new debounce timer
    _debounceTimer = Timer(debounceDuration, () {
      _performSearch(value.trim());
    });
  }

  Future<void> _performSearch(String searchQuery) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final results = await ApiService.instance.searchMedia(searchQuery);
      searchResults.value = results;

      if (results.isEmpty) {
        errorMessage.value = 'No results found';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      searchResults.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void clearSearch() {
    query.value = '';
    searchResults.clear();
    errorMessage.value = '';
    isLoading.value = false;
    _debounceTimer?.cancel();
  }
}
