import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/presentation/controllers/home_controller.dart';
import 'package:rd_client/presentation/screens/add_torrents_screen.dart';
import 'package:rd_client/presentation/screens/torrent_page.dart';
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

  Color _getAccentColor(String? status) {
    switch (status) {
      case 'uploading':
        return const Color(0xFFFF6B35);
      case 'downloading':
        return const Color(0xFF3B82F6);
      case 'downloaded':
        return const Color(0xFF10B981);
      default:
        return const Color(0xFF6B7280);
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

  Timer? _fetchTimer;

  void fetchUpdatedTorrent() async {
    currentTorrent.value = await ApiService.instance.getSingleTorrent(
      widget.torrent.id.toString(),
    );

    if (currentTorrent.value.status != 'downloaded') {
      _fetchTimer = Timer(const Duration(seconds: 2), () {
        fetchUpdatedTorrent();
      });
    }
  }

  @override
  void dispose() {
    _fetchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (currentTorrent.value.status == 'waiting_files_selection' ||
            currentTorrent.value.status == 'magnet_conversion') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  AddTorrentsScreen(addedTorrent: currentTorrent.value),
            ),
          );
        } else {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => TorrentPage(torrent: currentTorrent.value),
            ),
          );
        }
        _fetchTimer?.cancel();
      },
      child: Dismissible(
        key: Key(currentTorrent.value.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Color(0xFFB91C1C)),
          child: const Icon(Icons.delete_rounded, color: Colors.white),
        ),
        onDismissed: (direction) async {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF1F2937),
              title: const Text(
                'Delete Torrent',
                style: TextStyle(color: Color(0xFFF9FAFB)),
              ),
              content: Text(
                'Are you sure you want to delete "${currentTorrent.value.filename ?? 'this torrent'}"?',
                style: const TextStyle(color: Color(0xFF9CA3AF)),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF9CA3AF)),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Color(0xFFB91C1C)),
                  ),
                ),
              ],
            ),
          );

          if (confirmed == true) {
            // Add your delete logic here
            showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (context) => Dialog(
                backgroundColor: const Color(0xFF1F2937),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB91C1C).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete_rounded,
                          color: Color(0xFFB91C1C),
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Deleting Torrent',
                        style: TextStyle(
                          color: Color(0xFFF9FAFB),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Please wait while we remove this torrent...',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFB91C1C),
                        ),
                        strokeWidth: 3,
                      ),
                    ],
                  ),
                ),
              ),
            );
            await ApiService.instance.deleteTorrent(
              currentTorrent.value.id.toString(),
            );
            Navigator.of(context).pop();
          }
          Get.find<HomeController>().fetchTorrents();
        },
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF374151).withOpacity(0.3),
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section with title and size
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTorrent.value.filename ?? '--',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFF9FAFB),
                                height: 1.3,
                                letterSpacing: -0.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              UtilityFunctions.formatBytes(
                                currentTorrent.value.bytes ?? 0,
                              ),
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Status indicator
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getAccentColor(
                            currentTorrent.value.status,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: _getAccentColor(
                                  currentTorrent.value.status,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _getStatusText(currentTorrent.value.status),
                              style: TextStyle(
                                color: _getAccentColor(
                                  currentTorrent.value.status,
                                ),
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Status-specific content
                  if (currentTorrent.value.status == 'uploading')
                    _buildUploadingSection(),

                  if (currentTorrent.value.status == 'downloading')
                    _buildDownloadingSection(),

                  if (currentTorrent.value.status == 'downloaded')
                    _buildDownloadedSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getStatusText(String? status) {
    switch (status) {
      case 'uploading':
        return 'CACHING';
      case 'downloading':
        return 'DOWNLOADING';
      case 'downloaded':
        return 'RD+ Available';
      default:
        return 'UNKNOWN';
    }
  }

  Widget _buildUploadingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFFF6B35).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.cloud_upload_rounded,
              color: Color(0xFFFF6B35),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Caching to RD+',
                  style: TextStyle(
                    color: Color(0xFFF3F4F6),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: -0.1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (currentTorrent.value.progress ?? 0) / 100,
                        backgroundColor: const Color(0xFF374151),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFFF6B35),
                        ),
                        minHeight: 4,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${currentTorrent.value.progress?.toString() ?? '0'}%',
                      style: const TextStyle(
                        color: Color(0xFFFF6B35),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.download_rounded,
                  color: Color(0xFF3B82F6),
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Downloading',
                      style: TextStyle(
                        color: Color(0xFFF3F4F6),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (currentTorrent.value.progress ?? 0) / 100,
                            backgroundColor: const Color(0xFF374151),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF3B82F6),
                            ),
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${currentTorrent.value.progress?.toString() ?? '0'}%',
                          style: const TextStyle(
                            color: Color(0xFF3B82F6),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: const Color(0xFF374151).withOpacity(0.5), height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.speed_rounded,
                  color: Color(0xFF10B981),
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Speed: ',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                '${UtilityFunctions.formatBytes(currentTorrent.value.speed ?? 0)}/s',
                style: const TextStyle(
                  color: Color(0xFF10B981),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadedSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF10B981).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ready for Download',
                  style: TextStyle(
                    color: Color(0xFFF3F4F6),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: -0.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Added: ${DateFormat('dd MMM yy').format(DateTime.parse(currentTorrent.value.added!)).toUpperCase()}',
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
