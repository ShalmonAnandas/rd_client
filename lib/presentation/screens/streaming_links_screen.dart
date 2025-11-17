import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:get/get.dart';
import 'package:rd_client/models/torrentio_stream_model.dart';
import 'package:rd_client/presentation/controllers/streaming_links_controller.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/services/watch_progress_service.dart';
import 'package:rd_client/widgets/watch_progress_dialog.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class StreamingLinksScreen extends StatefulWidget {
  final String mediaType;
  final String imdbId;
  final String title;
  final int? season;
  final int? episode;
  final String? posterPath; // Add poster path for library
  final String? overview; // Add overview for library

  const StreamingLinksScreen({
    super.key,
    required this.mediaType,
    required this.imdbId,
    required this.title,
    this.season,
    this.episode,
    this.posterPath,
    this.overview,
  });

  @override
  State<StreamingLinksScreen> createState() => _StreamingLinksScreenState();
}

class _StreamingLinksScreenState extends State<StreamingLinksScreen>
    with WidgetsBindingObserver {
  late StreamingLinksController controller;
  DateTime? _videoLaunchTime;
  String? _currentlyWatchingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = Get.put(
      StreamingLinksController(
        mediaType: widget.mediaType,
        imdbId: widget.imdbId,
        season: widget.season,
        episode: widget.episode,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Get.delete<StreamingLinksController>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.season != null && widget.episode != null)
              Text(
                'Season ${widget.season} Episode ${widget.episode}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingShimmer();
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.circleAlert,
                  size: 64,
                  color: Colors.red.withOpacity(0.7),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: controller.loadStreams,
                  icon: const Icon(LucideIcons.refreshCw),
                  label: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final streams = controller.streams;
        if (streams.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.library,
                  size: 64,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  'No streams available',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try again later or check your RealDebrid account',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: streams.length,
          itemBuilder: (context, index) {
            final stream = streams[index];
            return _buildStreamCard(stream);
          },
        );
      }),
    );
  }

  Widget _buildStreamCard(TorrentioStream stream) {
    // Parse the title to extract information
    final titleLines = stream.title?.split('\n') ?? [];
    final quality = stream.name?.split('\n').last ?? 'Unknown Quality';
    final isCached = stream.name?.contains('[RD+]') ?? false;

    String torrentName = '';
    String details = '';

    if (titleLines.isNotEmpty) {
      torrentName = titleLines[0];
    }
    if (titleLines.length > 1) {
      details = titleLines.sublist(1).join(' • ');
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isCached
              ? Colors.green.withOpacity(0.3)
              : Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => _playStream(stream),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quality badge and cached status
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      quality,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isCached) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.circleCheck,
                            color: Colors.green[300],
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'CACHED',
                            style: TextStyle(
                              color: Colors.green[300],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const Spacer(),
                  Icon(
                    LucideIcons.circlePlay,
                    color: Colors.deepPurple[300],
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Torrent name
              Text(
                torrentName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (details.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _playStream(TorrentioStream stream) async {
    if (stream.url == null) {
      Get.snackbar(
        'Error',
        'Stream URL not available',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Generate a unique ID for this stream
    final streamId = WatchProgressService.generateIdFromUrl(stream.url!);
    final filename =
        stream.title?.split('\n').firstOrNull ??
        '${widget.title}${widget.season != null ? ' S${widget.season}E${widget.episode}' : ''}';

    // Check for existing watch progress
    final existingProgress = await WatchProgressService.instance
        .getWatchProgress(streamId);

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
      id: streamId,
      filename: filename,
      position: shouldResume ? (existingProgress?.position ?? 0) : 0,
      duration: existingProgress?.duration ?? 0,
      lastWatched: DateTime.now(),
      downloadUrl: stream.url,
      mediaType: widget.mediaType, // 'movie' or 'tv'
      mediaTitle: widget.title,
      seasonNumber: widget.season,
      episodeNumber: widget.episode,
      posterPath: widget.posterPath,
      overview: widget.overview,
    );

    await WatchProgressService.instance.saveWatchProgress(progress);

    // Track launch time for progress estimation
    _videoLaunchTime = DateTime.now();
    _currentlyWatchingId = streamId;

    try {
      // Get the default video app
      final defaultVideoApp = await StorageService.instance
          .getDefaultVideoApp();

      // Build URL with timestamp parameter for resume (some players support this)
      String url = stream.url!;
      if (shouldResume &&
          existingProgress != null &&
          existingProgress.position > 0) {
        final timeInSeconds = (existingProgress.position / 1000).floor();
        // Add timestamp parameter (works with some players like VLC, MX Player)
        url = '$url#t=$timeInSeconds';
      }

      // Launch the Torrentio URL directly with Android Intent
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: defaultVideoApp,
        type: 'video/*',
      );
      await intent.launch();
    } catch (e) {
      // Fallback to url_launcher if AndroidIntent fails
      try {
        final uri = Uri.parse(stream.url!);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          Get.snackbar(
            'Error',
            'Could not open video player',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to play stream: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
        );
      }
    }
  }

  Widget _buildLoadingShimmer() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
