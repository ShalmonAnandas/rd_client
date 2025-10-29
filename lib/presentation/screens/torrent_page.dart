import 'dart:async';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/utility_functions.dart';
import 'package:rd_client/widgets/display_tile_shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class TorrentPage extends StatefulWidget {
  const TorrentPage({super.key, required this.torrent});

  final Torrent torrent;

  @override
  State<TorrentPage> createState() => _TorrentPageState();
}

class _TorrentPageState extends State<TorrentPage> {
  Rx<Torrent> currentTorrent = Torrent().obs;
  Timer? _fetchTimer;

  @override
  void initState() {
    super.initState();
    if (widget.torrent.status == 'downloading') {
      fetchUpdatedTorrent();
    } else {
      currentTorrent.value = widget.torrent;
    }
  }

  @override
  void dispose() {
    _fetchTimer?.cancel();
    super.dispose();
  }

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

  IconData _getStatusIcon(String? status) {
    switch (status) {
      case 'uploading':
        return Icons.cloud_upload_rounded;
      case 'downloading':
        return Icons.download_rounded;
      case 'downloaded':
        return Icons.check_circle_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: screenHeight * 0.3,
            floating: false,
            pinned: true,
            // backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(
                () => Stack(
                  children: [
                    // Gradient Background
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _getAccentColor(
                              currentTorrent.value.status,
                            ).withOpacity(0.8),
                            _getAccentColor(
                              currentTorrent.value.status,
                            ).withOpacity(0.2),
                            const Color(0xFF0A0E27),
                          ],
                        ),
                      ),
                    ),
                    // Floating Particles Effect
                    ...List.generate(
                      15,
                      (index) => Positioned(
                        left: (index * 37) % screenWidth,
                        top: (index * 23) % (screenHeight * 0.3),
                        child: Container(
                          width: 4 + (index % 3) * 2,
                          height: 4 + (index % 3) * 2,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    // Content
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Status Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _getAccentColor(
                                    currentTorrent.value.status,
                                  ).withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _getStatusIcon(currentTorrent.value.status),
                                    color: _getAccentColor(
                                      currentTorrent.value.status,
                                    ),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _getStatusText(currentTorrent.value.status),
                                    style: TextStyle(
                                      color: _getAccentColor(
                                        currentTorrent.value.status,
                                      ),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Title
                            Text(
                              currentTorrent.value.filename ??
                                  'Unknown Torrent',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            // Size info with icon
                            Row(
                              children: [
                                Icon(
                                  Icons.storage_rounded,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  UtilityFunctions.formatBytes(
                                    currentTorrent.value.bytes ?? 0,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            // const Spacer(),
                            // // Progress Section (if applicable)
                            // if (currentTorrent.value.status == 'uploading' ||
                            //     currentTorrent.value.status == 'downloading')
                            //   _buildHeroProgressSection(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main Content
          if (currentTorrent.value.status != 'downloaded')
            SliverToBoxAdapter(
              child: Obx(() => _buildGlassmorphicStatusCard()),
            ),
          // Files List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final link = widget.torrent.links![index];
              return FutureBuilder<UnrestrictedLinkModel?>(
                future: ApiService.instance.getUnrestrictedLink(link),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return DisplayTileShimmer();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final unrestrictedLink = snapshot.data;
                    if (unrestrictedLink == null) {
                      return const SizedBox.shrink();
                    }

                    return InkWell(
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(text: unrestrictedLink.download ?? ''),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Download link copied to clipboard'),
                            backgroundColor: const Color(0xFF10B981),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      onTap: () async {
                        final defaultVideoApp = await StorageService.instance
                            .getDefaultVideoApp();
                        if (unrestrictedLink.streamable == 1) {
                          final intent = AndroidIntent(
                            action: 'action_view',
                            data: unrestrictedLink.download,
                            package: defaultVideoApp,
                            type: 'video/*',
                          );
                          intent.launch();
                        } else {
                          launchUrl(
                            Uri.parse(unrestrictedLink.download ?? ''),
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: _buildGlassDownloadedContent(unrestrictedLink),
                      ),
                    );
                  }
                },
              );
            }, childCount: widget.torrent.links?.length ?? 0),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassmorphicStatusCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        // borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          if (currentTorrent.value.status == 'uploading')
            _buildGlassUploadingContent(),
          if (currentTorrent.value.status == 'downloading')
            _buildGlassDownloadingContent(),
        ],
      ),
    );
  }

  Widget _buildGlassUploadingContent() {
    final progress = (currentTorrent.value.progress ?? 0) / 100;
    final accentColor = _getAccentColor(currentTorrent.value.status);
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFF6B35).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.cloud_upload_rounded,
                color: Color(0xFFFF6B35),
                size: 32,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Caching to RD+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your torrent is being processed and cached on RD+ servers for instant access.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: progress,
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    accentColor,
                                    accentColor.withOpacity(0.7),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: accentColor.withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGlassDownloadingContent() {
    final progress = (currentTorrent.value.progress ?? 0) / 100;
    final accentColor = _getAccentColor(currentTorrent.value.status);
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF3B82F6).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.download_rounded,
                color: Color(0xFF3B82F6),
                size: 32,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Downloading to RD+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.speed_rounded,
                        color: const Color(0xFF10B981),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${UtilityFunctions.formatBytes(currentTorrent.value.speed ?? 0)}/s',
                        style: const TextStyle(
                          color: Color(0xFF10B981),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    children: [
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: progress,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                accentColor,
                                accentColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGlassDownloadedContent(UnrestrictedLinkModel model) {
    final String filename = model.filename ?? 'Unknown';
    final String mime = model.mimeType ?? '';
    final int size = model.filesize ?? 0;
    final String sizeText = UtilityFunctions.formatBytes(size);
    final String hostIcon = model.hostIcon ?? '';
    final String download = model.download ?? '';
    final bool streamable = model.streamable == 1;
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Image.network(
                hostIcon,
                width: 32,
                height: 32,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported, size: 32),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filename,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (mime.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF10B981).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            mime,
                            style: const TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          sizeText,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Added: ${currentTorrent.value.added != null ? DateFormat('MMMM dd, yyyy').format(DateTime.parse(currentTorrent.value.added!)) : 'Unknown'}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (download.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: streamable
                      ? const Color(0xFF8B5CF6).withOpacity(0.2)
                      : const Color(0xFF10B981).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: streamable
                        ? const Color(0xFF8B5CF6).withOpacity(0.4)
                        : const Color(0xFF10B981).withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: () async {
                    if (streamable) {
                      launchUrl(
                        Uri.parse(download),
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    } else {
                      launchUrl(
                        Uri.parse(download),
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  icon: Icon(
                    streamable
                        ? Icons.play_arrow_rounded
                        : Icons.download_rounded,
                    color: streamable
                        ? const Color(0xFF8B5CF6)
                        : const Color(0xFF10B981),
                    size: 20,
                  ),
                  tooltip: streamable ? 'Stream' : 'Download',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
