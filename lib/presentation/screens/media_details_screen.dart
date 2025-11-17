import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:get/get.dart';
import 'package:rd_client/models/media_details_model.dart';
import 'package:rd_client/models/season_model.dart';
import 'package:rd_client/presentation/controllers/media_details_controller.dart';
import 'package:rd_client/presentation/screens/streaming_links_screen.dart';
import 'package:rd_client/services/watch_progress_service.dart';
import 'package:shimmer/shimmer.dart';

class MediaDetailsScreen extends StatefulWidget {
  final String mediaType;
  final int mediaId;

  const MediaDetailsScreen({
    super.key,
    required this.mediaType,
    required this.mediaId,
  });

  @override
  State<MediaDetailsScreen> createState() => _MediaDetailsScreenState();
}

class _MediaDetailsScreenState extends State<MediaDetailsScreen>
    with SingleTickerProviderStateMixin {
  late MediaDetailsController controller;
  TabController? _tabController;
  int _previousSeasonCount = 0;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      MediaDetailsController(
        mediaType: widget.mediaType,
        mediaId: widget.mediaId,
      ),
    );

    // Listen to media details changes to update tab controller
    ever(controller.mediaDetails, (MediaDetailsModel? media) {
      if (media != null && widget.mediaType == 'tv' && media.seasons != null) {
        _updateTabController(media.seasons!.length);
      }
    });
  }

  void _updateTabController(int seasonCount) {
    if (_previousSeasonCount != seasonCount) {
      _tabController?.dispose();
      _tabController = TabController(length: seasonCount, vsync: this);
      _previousSeasonCount = seasonCount;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    Get.delete<MediaDetailsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
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
                Text(
                  controller.errorMessage.value,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        }

        final media = controller.mediaDetails.value;
        if (media == null) {
          return const Center(child: Text('No data available'));
        }

        return _buildContent(context, media);
      }),
    );
  }

  Widget _buildContent(BuildContext context, MediaDetailsModel media) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(context, media, screenHeight, screenWidth),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleAndMetadata(media),
                const SizedBox(height: 16),
                _buildGenreChips(media),
                const SizedBox(height: 24),
                _buildActionButtons(media),
                const SizedBox(height: 24),
                _buildStoryline(media),
                if (widget.mediaType == 'tv') ...[
                  const SizedBox(height: 24),
                  _buildEpisodes(media, orientation),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    MediaDetailsModel media,
    double screenHeight,
    double screenWidth,
  ) {
    final posterPath = media.backdropPath ?? media.posterPath;
    return Stack(
      children: [
        // Background Image
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.5,
          child: posterPath != null
              ? Image.network(
                  'http://image.tmdb.org/t/p/original$posterPath',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[900],
                      child: const Center(
                        child: Icon(
                          LucideIcons.film,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  color: Colors.grey[900],
                  child: const Center(
                    child: Icon(Icons.movie, color: Colors.grey, size: 50),
                  ),
                ),
        ),
        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                  const Color(0xFF0F0F0F).withOpacity(0.8),
                  const Color(0xFF0F0F0F),
                ],
                stops: const [0.0, 0.4, 0.8, 1.0],
              ),
            ),
          ),
        ),
        // Back Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
          child: IconButton(
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndMetadata(MediaDetailsModel media) {
    final title = media.title ?? media.name ?? 'Unknown';
    final year = _getYear(media.releaseDate ?? media.firstAirDate);
    final rating = media.voteAverage?.toStringAsFixed(1) ?? 'N/A';
    final runtime = media.runtime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (year.isNotEmpty)
              Text(
                year,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            if (year.isNotEmpty && runtime != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '•',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
              ),
            if (runtime != null)
              Text(
                _formatDuration(runtime),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            const Spacer(),
            Icon(LucideIcons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              rating,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenreChips(MediaDetailsModel media) {
    if (media.genres == null || media.genres!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: media.genres!.map((genre) {
        return Chip(
          label: Text(
            genre.name ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
          side: BorderSide.none,
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons(MediaDetailsModel media) {
    // Get IMDB ID from media or external IDs
    final imdbId = media.imdbId ?? media.externalIds?.imdbId;
    final canPlay = imdbId != null && imdbId.isNotEmpty;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: canPlay
                ? () {
                    final title = media.title ?? media.name ?? 'Unknown';
                    final posterPath = media.posterPath ?? media.backdropPath;
                    Get.to(
                      () => StreamingLinksScreen(
                        mediaType: widget.mediaType,
                        imdbId: imdbId,
                        title: title,
                        season: widget.mediaType == 'tv' ? 1 : null,
                        episode: widget.mediaType == 'tv' ? 1 : null,
                        posterPath: posterPath != null
                            ? 'http://image.tmdb.org/t/p/w500$posterPath'
                            : null,
                        overview: media.overview,
                      ),
                    );
                  }
                : null,
            icon: const Icon(LucideIcons.play, color: Colors.white),
            label: Text(
              widget.mediaType == 'movie' ? 'Watch Now' : 'Season 1 Episode 1',
              style: const TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: () {
            // TODO: Implement save/bookmark action
          },
          icon: const Icon(LucideIcons.bookmark, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.1),
            padding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryline(MediaDetailsModel media) {
    final overview = media.overview;
    if (overview == null || overview.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Storyline',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          overview,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildEpisodes(MediaDetailsModel media, Orientation orientation) {
    if (media.seasons == null || media.seasons!.isEmpty) {
      return const SizedBox.shrink();
    }

    if (_tabController == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Episodes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          dividerColor: Colors.transparent,
          tabs: media.seasons!.map((season) {
            return Tab(
              text: season.name ?? 'Season ${season.seasonNumber ?? ''}',
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: media.seasons!.map((season) {
              return _buildSeasonEpisodes(season);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonEpisodes(Season season) {
    if (season.seasonNumber == null) {
      return const Center(
        child: Text(
          'Season data unavailable',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Obx(() {
      final seasonData = controller.seasonsData[season.seasonNumber!];

      if (seasonData == null) {
        // Load season data if not already loaded
        controller.loadSeasonDetails(season.seasonNumber!);
        return _buildEpisodeShimmer();
      }

      if (seasonData.episodes == null || seasonData.episodes!.isEmpty) {
        return const Center(
          child: Text(
            'No episodes available',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      return ListView.builder(
        itemCount: seasonData.episodes!.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final episode = seasonData.episodes![index];
          return _buildEpisodeItem(episode);
        },
      );
    });
  }

  Widget _buildEpisodeItem(Episode episode) {
    const double itemHeight = 100.0;
    const double imageWidth = itemHeight * (16 / 9);

    // Get IMDB ID for navigation
    final media = controller.mediaDetails.value;
    final imdbId = media?.imdbId ?? media?.externalIds?.imdbId;
    final title = media?.title ?? media?.name ?? 'Unknown';

    // Generate episode stream URL for progress tracking
    final episodeIdentifier =
        imdbId != null &&
            episode.seasonNumber != null &&
            episode.episodeNumber != null
        ? '${imdbId}_S${episode.seasonNumber}E${episode.episodeNumber}'
        : null;

    return InkWell(
      onTap:
          imdbId != null &&
              episode.seasonNumber != null &&
              episode.episodeNumber != null
          ? () {
              final title = media?.title ?? media?.name ?? 'Unknown';
              final posterPath =
                  episode.stillPath ?? media?.posterPath ?? media?.backdropPath;
              Get.to(
                () => StreamingLinksScreen(
                  mediaType: 'tv',
                  imdbId: imdbId,
                  title: title,
                  season: episode.seasonNumber,
                  episode: episode.episodeNumber,
                  posterPath: posterPath != null
                      ? 'http://image.tmdb.org/t/p/w500$posterPath'
                      : null,
                  overview: episode.overview ?? media?.overview,
                ),
              );
            }
          : null,
      child: episodeIdentifier != null
          ? FutureBuilder<WatchProgress?>(
              future: WatchProgressService.instance.getWatchProgress(
                WatchProgressService.generateIdFromUrl(episodeIdentifier),
              ),
              builder: (context, progressSnapshot) {
                final watchProgress = progressSnapshot.data;
                final hasProgress =
                    watchProgress != null && watchProgress.position > 0;

                return Container(
                  height: itemHeight,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: hasProgress && !watchProgress.isWatched
                        ? Border.all(color: const Color(0xFF8B5CF6), width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Episode Image
                      SizedBox(
                        width: imageWidth,
                        height: itemHeight,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: episode.stillPath != null
                                  ? Image.network(
                                      'http://image.tmdb.org/t/p/original${episode.stillPath}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(
                                                  LucideIcons.tv,
                                                  color: Colors.grey,
                                                  size: 30,
                                                ),
                                              ),
                                            );
                                          },
                                    )
                                  : Container(
                                      color: Colors.grey[800],
                                      child: const Center(
                                        child: Icon(
                                          Icons.tv,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                            ),
                            // Watch progress overlay
                            if (hasProgress && !watchProgress.isWatched)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: LinearProgressIndicator(
                                  value: watchProgress.watchPercentage,
                                  backgroundColor: Colors.black.withOpacity(
                                    0.5,
                                  ),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF8B5CF6),
                                      ),
                                  minHeight: 4,
                                ),
                              ),
                            // Play icon with resume indicator
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: hasProgress && !watchProgress.isWatched
                                      ? const Color(0xFF8B5CF6).withOpacity(0.9)
                                      : Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  hasProgress && !watchProgress.isWatched
                                      ? LucideIcons.rotateCcw
                                      : LucideIcons.play,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            // Watched badge
                            if (hasProgress && watchProgress.isWatched)
                              Positioned(
                                top: 4,
                                right: 4,
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
                                        size: 12,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        'Watched',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
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
                      const SizedBox(width: 12),
                      // Episode Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'E${episode.episodeNumber}: ${episode.name ?? 'Unnamed Episode'}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                episode.overview ?? 'No description available.',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  if (episode.runtime != null &&
                                      episode.runtime! > 0)
                                    Text(
                                      '${episode.runtime} mins',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  if (hasProgress &&
                                      !watchProgress.isWatched) ...[
                                    if (episode.runtime != null &&
                                        episode.runtime! > 0)
                                      Text(
                                        ' • ',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12,
                                        ),
                                      ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF8B5CF6,
                                        ).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color(
                                            0xFF8B5CF6,
                                          ).withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        '${(watchProgress.watchPercentage * 100).toStringAsFixed(0)}% watched',
                                        style: const TextStyle(
                                          color: Color(0xFF8B5CF6),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Container(
              height: itemHeight,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Episode Image (fallback for when episodeIdentifier is null)
                  SizedBox(
                    width: imageWidth,
                    height: itemHeight,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: episode.stillPath != null
                              ? Image.network(
                                  'http://image.tmdb.org/t/p/original${episode.stillPath}',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[800],
                                      child: const Center(
                                        child: Icon(
                                          Icons.tv,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: Colors.grey[800],
                                  child: const Center(
                                    child: Icon(
                                      Icons.tv,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Episode Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'E${episode.episodeNumber}: ${episode.name ?? 'Unnamed Episode'}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            episode.overview ?? 'No description available.',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          if (episode.runtime != null && episode.runtime! > 0)
                            Text(
                              '${episode.runtime} mins',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildEpisodeShimmer() {
    const double itemHeight = 100.0;
    const double imageWidth = itemHeight * (16 / 9);

    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Container(
            height: itemHeight,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: imageWidth,
                  height: itemHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 14.0,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 100,
                          height: 12.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getYear(DateTime? date) {
    if (date == null) return '';
    return date.year.toString();
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0 && mins > 0) {
      return '${hours}h ${mins}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${mins}m';
    }
  }
}
