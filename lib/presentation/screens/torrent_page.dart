import 'dart:async';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/services/watch_progress_service.dart';
import 'package:rd_client/utils/utility_functions.dart';
import 'package:rd_client/widgets/display_tile_shimmer.dart';
import 'package:rd_client/widgets/watch_progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class TorrentPage extends StatefulWidget {
  const TorrentPage({super.key, required this.torrent});

  final Torrent torrent;

  @override
  State<TorrentPage> createState() => _TorrentPageState();
}

class _TorrentPageState extends State<TorrentPage> with WidgetsBindingObserver {
  Rx<Torrent> currentTorrent = Torrent().obs;
  Timer? _fetchTimer;
  DateTime? _videoLaunchTime;
  String? _currentlyWatchingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.torrent.status == 'downloading') {
      fetchUpdatedTorrent();
    } else {
      currentTorrent.value = widget.torrent;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _fetchTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // When user returns to the app, estimate watch progress
    if (state == AppLifecycleState.resumed &&
        _videoLaunchTime != null &&
        _currentlyWatchingId != null) {
      _saveEstimatedProgress();
    }
  }

  Future<void> _saveEstimatedProgress() async {
    if (_videoLaunchTime == null || _currentlyWatchingId == null) return;

    final watchDuration = DateTime.now().difference(_videoLaunchTime!);
    final watchedMilliseconds = watchDuration.inMilliseconds;

    // Only save if user watched for at least 10 seconds
    if (watchedMilliseconds < 10000) {
      _videoLaunchTime = null;
      _currentlyWatchingId = null;
      return;
    }

    final existingProgress = await WatchProgressService.instance
        .getWatchProgress(_currentlyWatchingId!);

    if (existingProgress != null) {
      final newPosition = existingProgress.position + watchedMilliseconds;
      final updatedProgress = WatchProgress(
        id: existingProgress.id,
        filename: existingProgress.filename,
        position: newPosition,
        duration: existingProgress.duration,
        lastWatched: DateTime.now(),
        downloadUrl: existingProgress.downloadUrl,
      );
      await WatchProgressService.instance.saveWatchProgress(updatedProgress);
    }

    _videoLaunchTime = null;
    _currentlyWatchingId = null;
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
        return LucideIcons.cloudUpload;
      case 'downloading':
        return LucideIcons.download;
      case 'downloaded':
        return LucideIcons.circleCheck;
      default:
        return LucideIcons.toolCase;
    }
  }

  Future<void> _handleVideoLaunch(
    UnrestrictedLinkModel unrestrictedLink,
  ) async {
    if (unrestrictedLink.download == null) return;

    final videoId = WatchProgressService.generateIdFromUrl(
      unrestrictedLink.download!,
    );

    // Check for existing watch progress
    final existingProgress = await WatchProgressService.instance
        .getWatchProgress(videoId);

    bool shouldResume = false;

    // Show resume dialog if there's existing progress and video is not fully watched
    if (existingProgress != null &&
        existingProgress.position > 10000 && // At least 10 seconds watched
        !existingProgress.isWatched &&
        mounted) {
      final resume = await WatchProgressDialog.show(
        context: context,
        progress: existingProgress,
      );

      if (resume == null) return; // User dismissed dialog
      shouldResume = resume;
    }

    // Save/update watch progress before launching
    final progress = WatchProgress(
      id: videoId,
      filename: unrestrictedLink.filename ?? 'Unknown',
      position: shouldResume ? (existingProgress?.position ?? 0) : 0,
      duration: existingProgress?.duration ?? 0,
      lastWatched: DateTime.now(),
      downloadUrl: unrestrictedLink.download,
      mediaType: 'torrent',
      mediaTitle: currentTorrent.value.filename,
    );

    await WatchProgressService.instance.saveWatchProgress(progress);

    // Track launch time for progress estimation
    _videoLaunchTime = DateTime.now();
    _currentlyWatchingId = videoId;

    // Launch the video
    final defaultVideoApp = await StorageService.instance.getDefaultVideoApp();

    if (unrestrictedLink.streamable == 1) {
      // Build URL with timestamp parameter for resume (some players support this)
      String url = unrestrictedLink.download!;
      if (shouldResume &&
          existingProgress != null &&
          existingProgress.position > 0) {
        final timeInSeconds = (existingProgress.position / 1000).floor();
        // Add timestamp parameter (works with some players like VLC, MX Player)
        url = '$url#t=$timeInSeconds';
      }

      // Add HTTP headers for Real-Debrid compatibility
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: defaultVideoApp,
        type: 'video/*',
        arguments: {
          'headers': {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Referer': 'https://real-debrid.com/',
          },
        },
      );
      await intent.launch();
    } else {
      await launchUrl(
        Uri.parse(unrestrictedLink.download!),
        mode: LaunchMode.externalApplication,
      );
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
                                  LucideIcons.hardDrive,
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
                        await _handleVideoLaunch(unrestrictedLink);
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
                LucideIcons.cloudUpload,
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
                LucideIcons.download,
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
                        LucideIcons.gauge,
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

    // Check for watch progress
    final videoId = WatchProgressService.generateIdFromUrl(download);

    return FutureBuilder<WatchProgress?>(
      future: WatchProgressService.instance.getWatchProgress(videoId),
      builder: (context, progressSnapshot) {
        final watchProgress = progressSnapshot.data;
        final hasProgress = watchProgress != null && watchProgress.position > 0;

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
                        const Icon(LucideIcons.imageOff, size: 32),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              filename,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (hasProgress && watchProgress.isWatched)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(
                                    0xFF10B981,
                                  ).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.circleCheck,
                                    color: const Color(0xFF10B981),
                                    size: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Watched',
                                    style: TextStyle(
                                      color: const Color(0xFF10B981),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
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
                                  color: const Color(
                                    0xFF10B981,
                                  ).withOpacity(0.3),
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
                      // Watch progress indicator
                      if (hasProgress && !watchProgress.isWatched) ...[
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  LucideIcons.history,
                                  color: const Color(0xFF8B5CF6),
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${(watchProgress.watchPercentage * 100).toStringAsFixed(0)}% watched',
                                  style: TextStyle(
                                    color: const Color(0xFF8B5CF6),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: watchProgress.watchPercentage,
                                backgroundColor: Colors.white.withOpacity(0.1),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF8B5CF6),
                                ),
                                minHeight: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        streamable ? LucideIcons.play : LucideIcons.download,
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
      },
    );
  }
}
