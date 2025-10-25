import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/utils/utility_functions.dart';

class DisplayTile extends StatefulWidget {
  const DisplayTile({super.key, required this.torrent});

  final Torrent torrent;

  @override
  State<DisplayTile> createState() => _DisplayTileState();
}

class _DisplayTileState extends State<DisplayTile> {
  Rx<Torrent> currentTorrent = Torrent().obs;

  Color _getTileColor(String? status) {
    switch (status) {
      case 'uploading':
        return Colors.orange.withOpacity(0.18);
      case 'downloading':
        return Colors.blue.withOpacity(0.18);
      case 'downloaded':
        return Colors.green.withOpacity(0.15);
      default:
        return Colors.grey.shade900;
    }
  }

  Color _getBorderColor(String? status) {
    switch (status) {
      case 'uploading':
        return Colors.orangeAccent;
      case 'downloading':
        return Colors.lightBlueAccent;
      case 'downloaded':
        return Colors.greenAccent;
      default:
        return Colors.grey.shade800;
    }
  }

  @override
  void initState() {
    if (widget.torrent.status == 'downloading') {
      fetchUpdatedTorrent();
    } else {
      currentTorrent.value = widget.torrent;
    }
    super.initState();
  }

  void fetchUpdatedTorrent() async {
    currentTorrent.value = await ApiService.instance.getSingleTorrent(
      widget.torrent.id.toString(),
    );

    Future.delayed(const Duration(seconds: 5), () {
      if (currentTorrent.value.status != 'downloaded') {
        fetchUpdatedTorrent();
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // height: 111,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: _getTileColor(currentTorrent.value.status),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: _getBorderColor(currentTorrent.value.status),
            width: 1.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      currentTorrent.value.filename ?? 'No Name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      UtilityFunctions.formatBytes(
                        currentTorrent.value.bytes ?? 0,
                      ),
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (currentTorrent.value.status == 'uploading')
                Row(
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      color: Colors.orangeAccent,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Uploading to RD Cache: ',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${currentTorrent.value.progress?.toString() ?? ''}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              if (currentTorrent.value.status == 'downloading')
                Row(
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.lightBlueAccent,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Downloaded: ',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${currentTorrent.value.progress?.toString() ?? ''}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.speed, color: Colors.greenAccent, size: 20),
                    SizedBox(width: 4),
                    Text(
                      'Speed: ',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${currentTorrent.value.speed?.toString() ?? ''} KB/s',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              if (currentTorrent.value.status == 'downloaded')
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'RD+ Available',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Added: ${DateFormat('dd MMM yy').format(DateTime.parse(currentTorrent.value.added!)).toUpperCase()}',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
