import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/services/watch_progress_service.dart';
import 'package:rd_client/widgets/watch_progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _watchProgressService = WatchProgressService.instance;
  List<WatchProgress> _watchHistory = [];
  bool _isLoading = true;
  String _filterType = 'all'; // 'all', 'movies', 'tv', 'torrents'

  @override
  void initState() {
    super.initState();
    _loadWatchHistory();
  }

  Future<void> _loadWatchHistory() async {
    setState(() => _isLoading = true);
    final history = await _watchProgressService.getRecentlyWatched(limit: 100);
    setState(() {
      _watchHistory = history;
      _isLoading = false;
    });
  }

  List<WatchProgress> get _filteredHistory {
    if (_filterType == 'all') return _watchHistory;

    return _watchHistory.where((item) {
      switch (_filterType) {
        case 'movies':
          return item.mediaType == 'movie';
        case 'tv':
          return item.mediaType == 'tv';
        case 'torrents':
          return item.mediaType == 'torrent' || item.mediaType == null;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildFilterChips(),
          if (_isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_filteredHistory.isEmpty)
            _buildEmptyState()
          else
            _buildWatchHistoryGrid(),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: const Color(0xFF0F0F0F),
      title: const Text(
        'Library',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.refreshCw),
          onPressed: _loadWatchHistory,
          tooltip: 'Refresh',
        ),
        PopupMenuButton<String>(
          icon: const Icon(LucideIcons.ellipsisVertical),
          onSelected: (value) async {
            if (value == 'clear_watched') {
              _clearWatchedItems();
            } else if (value == 'clear_all') {
              _clearAllHistory();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'clear_watched',
              child: Text('Clear Watched Items'),
            ),
            const PopupMenuItem(
              value: 'clear_all',
              child: Text('Clear All History'),
            ),
          ],
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildFilterChips() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip('All', 'all'),
              const SizedBox(width: 8),
              _buildFilterChip('Movies', 'movies'),
              const SizedBox(width: 8),
              _buildFilterChip('TV Shows', 'tv'),
              const SizedBox(width: 8),
              _buildFilterChip('Torrents', 'torrents'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String type) {
    final isSelected = _filterType == type;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() => _filterType = type);
      },
      backgroundColor: Colors.white.withOpacity(0.05),
      selectedColor: const Color(0xFF8B5CF6).withOpacity(0.3),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey[400],
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected
            ? const Color(0xFF8B5CF6)
            : Colors.white.withOpacity(0.1),
      ),
    );
  }

  SliverFillRemaining _buildEmptyState() {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.library,
              size: 80,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'No Watch History',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start watching content to see it here',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildWatchHistoryGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = _filteredHistory[index];
          return _buildWatchHistoryCard(item);
        }, childCount: _filteredHistory.length),
      ),
    );
  }

  Widget _buildWatchHistoryCard(WatchProgress item) {
    final hasImage = item.posterPath != null && item.posterPath!.isNotEmpty;
    final isWatched = item.isWatched;

    return GestureDetector(
      onTap: () => _handleItemTap(item),
      onLongPress: () => _showItemOptions(item),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: !isWatched
                ? const Color(0xFF8B5CF6).withOpacity(0.5)
                : Colors.white.withOpacity(0.1),
            width: !isWatched ? 2 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              if (hasImage)
                Image.network(
                  item.posterPath!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildFallbackImage(item),
                )
              else
                _buildFallbackImage(item),

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),

              // Progress Bar
              if (!isWatched)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value: item.watchPercentage,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF8B5CF6),
                    ),
                    minHeight: 4,
                  ),
                ),

              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Play/Resume Icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: !isWatched
                              ? const Color(0xFF8B5CF6)
                              : Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          !isWatched
                              ? LucideIcons.rotateCcw
                              : LucideIcons.circleCheck,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Title
                      Text(
                        item.mediaTitle ?? item.filename,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Episode info for TV shows
                      if (item.mediaType == 'tv' &&
                          item.seasonNumber != null &&
                          item.episodeNumber != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'S${item.seasonNumber}E${item.episodeNumber}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],

                      const SizedBox(height: 4),

                      // Last watched time
                      Text(
                        _formatLastWatched(item.lastWatched),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 11,
                        ),
                      ),

                      // Watch percentage
                      if (!isWatched)
                        Text(
                          '${(item.watchPercentage * 100).toStringAsFixed(0)}% watched',
                          style: const TextStyle(
                            color: Color(0xFF8B5CF6),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Watched Badge
              if (isWatched)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.circleCheck,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Watched',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackImage(WatchProgress item) {
    IconData icon;
    Color color;

    switch (item.mediaType) {
      case 'movie':
        icon = LucideIcons.film;
        color = const Color(0xFF8B5CF6);
        break;
      case 'tv':
        icon = LucideIcons.tv;
        color = const Color(0xFF3B82F6);
        break;
      default:
        icon = LucideIcons.library;
        color = const Color(0xFF10B981);
    }

    return Container(
      color: Colors.grey[900],
      child: Center(child: Icon(icon, size: 48, color: color.withOpacity(0.5))),
    );
  }

  String _formatLastWatched(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM d').format(dateTime);
    }
  }

  Future<void> _handleItemTap(WatchProgress item) async {
    if (item.downloadUrl == null || item.downloadUrl!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Video URL not available'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show resume dialog if there's existing progress and video is not fully watched
    bool shouldResume = false;
    if (!item.isWatched && item.position > 10000 && mounted) {
      final resume = await WatchProgressDialog.show(
        context: context,
        progress: item,
      );

      if (resume == null) return; // User dismissed dialog
      shouldResume = resume;
    }

    // Update watch progress
    final updatedProgress = WatchProgress(
      id: item.id,
      filename: item.filename,
      position: shouldResume ? item.position : 0,
      duration: item.duration,
      lastWatched: DateTime.now(),
      downloadUrl: item.downloadUrl,
      mediaType: item.mediaType,
      mediaTitle: item.mediaTitle,
      seasonNumber: item.seasonNumber,
      episodeNumber: item.episodeNumber,
      posterPath: item.posterPath,
      overview: item.overview,
    );

    await _watchProgressService.saveWatchProgress(updatedProgress);

    try {
      // Get the default video app
      final defaultVideoApp = await StorageService.instance
          .getDefaultVideoApp();

      // Build URL with timestamp parameter for resume (some players support this)
      String url = item.downloadUrl!;
      if (shouldResume && item.position > 0) {
        final timeInSeconds = (item.position / 1000).floor();
        // Add timestamp parameter (works with some players like VLC, MX Player)
        url = '$url#t=$timeInSeconds';
      }

      // Launch the video with Android Intent
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
            'Referer': item.mediaType == 'torrent'
                ? 'https://real-debrid.com/'
                : 'https://torrentio.strem.fun/',
          },
        },
      );
      await intent.launch();
    } catch (e) {
      // Fallback to url_launcher if AndroidIntent fails
      try {
        final uri = Uri.parse(item.downloadUrl!);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not open video player'),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to play video: $e'),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void _showItemOptions(WatchProgress item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1F3A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(LucideIcons.play, color: Colors.white),
              title: Text(
                item.isWatched ? 'Play Again' : 'Resume',
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _handleItemTap(item);
              },
            ),
            if (!item.isWatched)
              ListTile(
                leading: const Icon(
                  LucideIcons.circleCheck,
                  color: Colors.green,
                ),
                title: const Text(
                  'Mark as Watched',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _watchProgressService.markAsWatched(item.id);
                  _loadWatchHistory();
                },
              ),
            ListTile(
              leading: const Icon(LucideIcons.trash2, color: Colors.red),
              title: const Text(
                'Remove from Library',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                Navigator.pop(context);
                await _watchProgressService.deleteWatchProgress(item.id);
                _loadWatchHistory();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Removed from library'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _clearWatchedItems() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1F3A),
        title: const Text(
          'Clear Watched Items?',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'This will remove all fully watched items from your library.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      for (final item in _watchHistory.where((i) => i.isWatched)) {
        await _watchProgressService.deleteWatchProgress(item.id);
      }
      _loadWatchHistory();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Watched items cleared')));
      }
    }
  }

  Future<void> _clearAllHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1F3A),
        title: const Text(
          'Clear All History?',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'This will remove all items from your library. This action cannot be undone.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _watchProgressService.clearAllWatchProgress();
      _loadWatchHistory();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('All history cleared')));
      }
    }
  }
}
