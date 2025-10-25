import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:rd_client/presentation/controllers/home_controller.dart';
import 'package:rd_client/presentation/screens/add_torrents_screen.dart';
import 'package:rd_client/presentation/screens/torrent_page.dart';
import 'package:rd_client/widgets/display_tile.dart';
import 'package:rd_client/widgets/display_tile_shimmer.dart';
import 'package:rd_client/widgets/token_setup_popup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeController controller = Get.put(HomeController());
  final _appLinks = AppLinks();

  @override
  void initState() {
    _appLinks.uriLinkStream.listen((uri) {
      if (uri.scheme == 'magnet') {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddTorrentsScreen(magnetLink: uri.toString()),
          ),
        );
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchTorrents();
      WidgetsBinding.instance.addObserver(this);
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _appLinks.uriLinkStream.listen((uri) {
        if (uri.scheme == 'magnet') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  AddTorrentsScreen(magnetLink: uri.toString()),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RD Client'),
        actions: [
          IconButton(
            onPressed: () => TokenSetupPopup.show(context),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (controller.torrents.isEmpty) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => DisplayTileShimmer(),
            );
          }
          return ListView.builder(
            itemCount: controller.torrents.length,
            itemBuilder: (context, index) {
              final torrent = controller.torrents[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TorrentPage(torrent: torrent),
                  ),
                ),
                child: DisplayTile(torrent: torrent),
              );
            },
          );
        }),
      ),
    );
  }
}
