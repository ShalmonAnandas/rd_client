import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:get/get.dart';
import 'package:rd_client/models/media_model.dart';
import 'package:rd_client/presentation/controllers/search_controller.dart'
    as search_ctrl;
import 'package:rd_client/presentation/screens/media_details_screen.dart';
import 'package:rd_client/widgets/glass_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search_ctrl.SearchController searchController = Get.put(
    search_ctrl.SearchController(),
  );
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        searchController.clearSearch();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: Hero(
            tag: 'search_textfield',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GlassTextField(
                autoFocus: true,
                controller: textController,
                onChanged: searchController.updateQuery,
              ),
            ),
          ),
          leadingWidth: 30,
        ),
        body: Obx(() {
          if (searchController.query.value.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.search,
                    size: 64,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Search for movies and TV shows',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          if (searchController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (searchController.errorMessage.value.isNotEmpty) {
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
                    searchController.errorMessage.value,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (searchController.searchResults.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.searchX,
                    size: 64,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No results found',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: searchController.searchResults.length,
            itemBuilder: (context, index) {
              final media = searchController.searchResults[index];
              return _buildMediaCard(media);
            },
          );
        }),
      ),
    );
  }

  Widget _buildMediaCard(MediaModel media) {
    final title = media.title ?? media.name ?? 'Unknown';
    final posterPath = media.posterPath;
    final overview = media.overview ?? 'No description available';
    final mediaType = media.mediaType ?? 'unknown';
    final releaseDate = media.releaseDate ?? '';
    final rating = media.voteAverage?.toStringAsFixed(1) ?? 'N/A';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to media details
          if (media.id != null && media.mediaType != null) {
            Get.to(
              () => MediaDetailsScreen(
                mediaType: media.mediaType!,
                mediaId: media.id!,
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: posterPath != null
                    ? Image.network(
                        'http://image.tmdb.org/t/p/original$posterPath',
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildPlaceholder();
                        },
                      )
                    : _buildPlaceholder(),
              ),
              const SizedBox(width: 12),
              // Media Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: mediaType == 'movie'
                                ? Colors.blue.withOpacity(0.3)
                                : Colors.purple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            mediaType.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (releaseDate.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            releaseDate.split('-').first,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          ),
                        ],
                        const Spacer(),
                        Icon(LucideIcons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      overview,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 80,
      height: 120,
      color: Colors.white.withOpacity(0.1),
      child: Icon(
        LucideIcons.film,
        color: Colors.white.withOpacity(0.3),
        size: 40,
      ),
    );
  }
}
