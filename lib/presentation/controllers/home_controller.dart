import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/services/api_service.dart';

class HomeController extends GetxController {
  RxList<Torrent> torrents = <Torrent>[].obs;

  late final ApiService apiService;

  @override
  void onInit() {
    apiService = ApiService.instance;
    super.onInit();
  }

  void fetchTorrents() async {
    torrents.value = await apiService.getTorrentList();
  }
}
