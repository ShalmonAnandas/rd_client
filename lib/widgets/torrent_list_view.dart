import 'package:flutter/material.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/widgets/display_tile.dart';
import 'package:rd_client/widgets/display_tile_shimmer.dart';

class TorrentListView extends StatelessWidget {
  final List<Torrent> torrents;
  final bool isLoading;
  final Future<void> Function() onRefresh;

  const TorrentListView({
    super.key,
    required this.torrents,
    required this.isLoading,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading || torrents.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const DisplayTileShimmer(),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: torrents.length,
        itemBuilder: (context, index) {
          final torrent = torrents[index];
          return DisplayTile(torrent: torrent);
        },
      ),
    );
  }
}
