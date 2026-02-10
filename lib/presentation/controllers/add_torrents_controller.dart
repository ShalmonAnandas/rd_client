import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/presentation/screens/home_screen.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/utils/app_constants.dart';

class AddTorrentsController extends GetxController {
  final Rx<Torrent?> addedTorrent = Rx<Torrent?>(null);
  final RxSet<int> selectedFileIds = <int>{}.obs;
  final RxBool selectAll = false.obs;
  final RxBool isLoading = true.obs;

  String? magnetLink;
  Torrent? initialTorrent;

  void initialize(String? magnetLink, Torrent? addedTorrent) {
    this.magnetLink = magnetLink;
    initialTorrent = addedTorrent;
    this.addedTorrent.value = addedTorrent;

    fetchAddedTorrent().then((_) {
      if (AppConstants.debridProvider == AppConstants.torboxProvider) {
        selectedFileIds.clear();
        // TorBox does not require explicit file selection; preselect all so
        // users can continue without manual selection.
        addedTorrent?.files
            ?.where((file) => file.id != null)
            .forEach((file) => selectedFileIds.add(file.id!));
        selectAll.value = selectedFileIds.isNotEmpty;
      } else {
        selectedFileIds.clear();
        selectAll.value = false;
      }
      isLoading.value = false;
    });
  }

  Future<void> fetchAddedTorrent() async {
    String? id;
    if (magnetLink?.contains('magnet:') ?? true) {
      id = addedTorrent.value == null
          ? await ApiService.instance.addMagnet(magnetLink!)
          : addedTorrent.value!.id;
    } else {
      if (kIsWeb) {
        Get.snackbar(
          'Unsupported on Web',
          'Torrent file uploads are not available on web.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      id = addedTorrent.value == null
          ? await ApiService.instance.addTorrent(magnetLink!)
          : addedTorrent.value!.id;
    }

    addedTorrent.value = await ApiService.instance.getSingleTorrent(
      id.toString(),
    );

    if (addedTorrent.value?.status == 'magnet_conversion') {
      fetchAddedTorrent();
    }
  }

  void toggleSelectAll(bool? value) {
    selectAll.value = value ?? false;
    if (selectAll.value) {
      selectedFileIds.clear();
      selectedFileIds.addAll({
        for (var f in addedTorrent.value!.files!)
          if (f.id != null) f.id!,
      });
    } else {
      selectedFileIds.clear();
    }
  }

  void toggleFileSelection(int? fileId, bool? value) {
    if (fileId != null) {
      if (value == true) {
        selectedFileIds.add(fileId);
      } else {
        selectedFileIds.remove(fileId);
      }
      // Update selectAll state
      selectAll.value =
          selectedFileIds.length ==
          addedTorrent.value!.files!.where((f) => f.id != null).length;
    }
  }

  Future<void> addSelectedFiles(BuildContext context) async {
    if (AppConstants.debridProvider != AppConstants.torboxProvider) {
      await ApiService.instance.addFilesToTorrent(
        addedTorrent.value!.id.toString(),
        selectedFileIds.join(','),
      );
    }

    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  }
}
