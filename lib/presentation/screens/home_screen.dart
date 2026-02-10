import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:rd_client/presentation/controllers/home_controller.dart';
import 'package:rd_client/presentation/screens/add_torrents_screen.dart';
import 'package:rd_client/presentation/screens/library_screen.dart';
import 'package:rd_client/presentation/screens/search_entry_point.dart';
import 'package:rd_client/presentation/screens/settings_screen.dart';
import 'package:rd_client/utils/app_constants.dart';
import 'package:rd_client/utils/responsive_constants.dart';
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
    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
    currentIndex.value = 3;
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
        children: [
          SearchEntryPoint(),
          _buildBody(),
          const LibraryScreen(),
          const SettingsScreen(),
        ],
      ),
    );
  }

  Widget _buildGlassBottomNav() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = MediaQuery.of(context).size.width >
            MediaQuery.of(context).size.height;
        final navMaxWidth = isLandscape
            ? ResponsiveConstants.bottomNavLandscapeMaxWidth
            : ResponsiveConstants.bottomNavMaxWidth;

        return Obx(
          () => Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: navMaxWidth,
              ),
              child: Container(
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
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Animated sliding indicator
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        alignment: currentIndex.value == 0
                            ? Alignment(-1, 0)
                            : currentIndex.value == 1
                            ? Alignment(-0.33, 0)
                            : currentIndex.value == 2
                            ? Alignment(0.33, 0)
                            : Alignment(1, 0),
                        child: FractionallySizedBox(
                          widthFactor: 0.25,
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
                          _buildSegmentedItem(0, LucideIcons.search, 'Search'),
                          _buildSegmentedItem(1, LucideIcons.download, 'RD'),
                          _buildSegmentedItem(2, LucideIcons.library, 'Library'),
                          _buildSegmentedItem(3, LucideIcons.settings, 'Settings'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
      },
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
                if (isSelected) ...[
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(title: const Text('RD Client'));
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
                      child: Icon(
                        LucideIcons.plus,
                        color: Colors.white,
                        size: 28,
                      ),
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
    return Obx(() {
      final hasToken = AppConstants.hasAnyToken;
      final hasBoth = AppConstants.hasBothProviders;
      if (!hasToken) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildTokenRequiredState(),
        );
      }
      if (!hasBoth) {
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
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Downloads'),
            bottom: const TabBar(
              indicatorColor: Color(0xFF3B82F6),
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFF9CA3AF),
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Real Debrid'),
                Tab(text: 'TorBox'),
              ],
            ),
          ),
          floatingActionButton: _buildFAB(),
          body: TabBarView(
            children: [
              // All torrents
              Center(
                child: Obx(() => TorrentListView(
                      torrents: controller.torrents,
                      isLoading: controller.isLoading.value,
                      onRefresh: controller.fetchTorrents,
                    )),
              ),
              // RD torrents
              Center(
                child: Obx(() => TorrentListView(
                      torrents: controller.rdTorrents,
                      isLoading: controller.isRdLoading.value,
                      onRefresh: controller.fetchTorrents,
                    )),
              ),
              // TorBox torrents
              Center(
                child: Obx(() => TorrentListView(
                      torrents: controller.torboxTorrents,
                      isLoading: controller.isTorboxLoading.value,
                      onRefresh: controller.fetchTorrents,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTokenRequiredState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.key,
              size: 72,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Set up your API token',
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add a Real Debrid or TorBox token to load your downloads.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: _navigateToSettings,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withOpacity(0.2)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(LucideIcons.settings, size: 18),
              label: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
