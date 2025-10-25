import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/widgets/display_tile.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Torrent Details')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DisplayTile(torrent: widget.torrent),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.torrent.links?.length ?? 0,
              itemBuilder: (context, index) {
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

                      final String filename =
                          unrestrictedLink.filename ?? 'Unknown';
                      final String mime = unrestrictedLink.mimeType ?? '';
                      final int? size = unrestrictedLink.filesize;
                      final String sizeText = size == null
                          ? ''
                          : UtilityFunctions.formatBytes(size);
                      final String? hostIcon = unrestrictedLink.hostIcon;
                      final String? download = unrestrictedLink.download;
                      final bool streamable = unrestrictedLink.streamable == 1;

                      return InkWell(
                        onLongPress: () {
                          launchUrl(
                            Uri.parse(download!),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (hostIcon != null && hostIcon.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Image.network(
                                      hostIcon,
                                      width: 32,
                                      height: 32,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.image_not_supported,
                                        size: 32,
                                      ),
                                    ),
                                  )
                                else
                                  const Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(
                                      Icons.insert_drive_file,
                                      size: 32,
                                    ),
                                  ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filename,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 4),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 4,
                                        children: [
                                          if (mime.isNotEmpty)
                                            Chip(
                                              label: Text(mime),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                          if (sizeText.isNotEmpty)
                                            Chip(
                                              label: Text(sizeText),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  tooltip: 'Stream or Download',
                                  icon: streamable
                                      ? Icon(Icons.play_arrow)
                                      : Icon(Icons.download),
                                  onPressed:
                                      download == null || download.isEmpty
                                      ? null
                                      : () async {
                                          if (streamable) {
                                            launchUrl(
                                              Uri.parse(download),
                                              mode: LaunchMode
                                                  .externalNonBrowserApplication,
                                            );
                                          } else {
                                            launchUrl(
                                              Uri.parse(download),
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          }
                                        },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
