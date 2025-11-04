import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:rd_client/presentation/controllers/home_controller.dart';
import 'package:rd_client/presentation/screens/add_torrents_screen.dart';
import 'package:rd_client/presentation/screens/search_entry_point.dart';
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

  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _buildGlassBottomNav(),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [SearchEntryPoint(), _buildBody()],
      ),
    );
  }

  Widget _buildGlassBottomNav() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(24),
        height: 56,
        child: LiquidGlassLayer(
          settings: const LiquidGlassSettings(
            thickness: 20,
            blur: 2,
            refractiveIndex: 2,
          ),
          child: LiquidGlass(
            shape: LiquidRoundedSuperellipse(borderRadius: 50),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animated sliding indicator
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    alignment: currentIndex.value == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 1,
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  // Segmented buttons
                  Row(
                    children: [
                      _buildSegmentedItem(0, Icons.search, 'Search'),
                      _buildSegmentedItem(1, Icons.download, 'RD'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentedItem(int index, IconData icon, String label) {
    final isSelected = currentIndex.value == index;
    return Expanded(
      child: LiquidStretch(
        stretch: 0.3,
        interactionScale: 1.6,
        child: GestureDetector(
          onTap: () {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
            currentIndex.value = index;
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey.shade400,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.grey.shade400,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SizedBox(
        width: 60,
        height: 60,
        child: LiquidGlassLayer(
          settings: const LiquidGlassSettings(
            thickness: 20,
            blur: 2,
            refractiveIndex: 2,
          ),
          child: LiquidStretch(
            interactionScale: 1.15,
            child: LiquidGlass(
              shape: LiquidOval(),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _showAddMagnetDialog,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.add, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),

      body: Center(
        child: Obx(() {
          return TorrentListView(
            torrents: controller.torrents,
            isLoading: controller.isLoading.value,
            onRefresh: controller.fetchTorrents,
          );
        }),
      ),
    );
  }
}
