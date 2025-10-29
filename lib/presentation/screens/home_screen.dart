import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:rd_client/presentation/controllers/home_controller.dart';
import 'package:rd_client/presentation/screens/add_torrents_screen.dart';
import 'package:rd_client/presentation/screens/settings_screen.dart';
import 'package:rd_client/widgets/add_magnet_dialog.dart';
import 'package:rd_client/widgets/torrent_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());
    _setupControllerCallbacks();
    _initializeApp();
  }

  void _setupControllerCallbacks() {
    controller.onMagnetLinkReceived = _navigateToAddTorrent;
    controller.onTorrentFileReceived = _navigateToAddTorrent;
    controller.onNavigateToSettings = _navigateToSettings;
  }

  Future<void> _initializeApp() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasToken = await controller.checkApiToken();
      if (!hasToken) {
        _showTokenWarning();
        _navigateToSettings();
      } else {
        await controller.fetchTorrents();
        WidgetsBinding.instance.addObserver(this);
      }
    });
  }

  void _showTokenWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please set your API token to use the APP.'),
      ),
    );
  }

  void _navigateToAddTorrent(String magnetLink) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => AddTorrentsScreen(magnetLink: magnetLink),
      ),
    ).then((_) {
      controller.fetchTorrents();
    });
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  void _showAddMagnetDialog() {
    showDialog(
      context: context,
      builder: (context) => AddMagnetDialog(onSubmit: _navigateToAddTorrent),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('RD Client'),
      actions: [
        IconButton(
          onPressed: _navigateToSettings,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 207, 10, 33),
      onPressed: _showAddMagnetDialog,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Obx(() {
        return TorrentListView(
          torrents: controller.torrents,
          isLoading: controller.isLoading.value,
          onRefresh: controller.fetchTorrents,
        );
      }),
    );
  }
}
