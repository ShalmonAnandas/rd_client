import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_client/presentation/controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadToken();
      await controller.loadVideoApps();
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0F1419),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF181A20),
        elevation: 0,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              _buildApiConfigurationSection(controller),
              const SizedBox(height: 20),
              _buildVideoAppSection(controller),
              const SizedBox(height: 20),
              _buildDebugSection(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181A20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2D3748).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF9FAFB),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF2D3748), height: 1, thickness: 1),
          Padding(padding: const EdgeInsets.all(16), child: child),
        ],
      ),
    );
  }

  Widget _buildApiConfigurationSection(SettingsController controller) {
    return _buildSectionContainer(
      title: 'Real Debrid API Token',
      icon: Icons.vpn_key_rounded,
      iconColor: const Color(0xFF3B82F6),
      child: Column(
        children: [
          Obx(() => _buildTokenField(controller)),
          const SizedBox(height: 12),
          Obx(() => _buildTokenActions(controller)),
        ],
      ),
    );
  }

  Widget _buildTokenField(SettingsController controller) {
    if (controller.isLoading.value) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
            strokeWidth: 2,
          ),
        ),
      );
    }

    if (!controller.isTokenEditable.value &&
        controller.tokenController.text.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0F1419),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF10B981).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 18,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Token Configured',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF3F4F6),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${controller.tokenController.text.substring(0, 8)}••••••••',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: controller.enableTokenEditing,
              icon: const Icon(
                Icons.edit_rounded,
                color: Color(0xFF9CA3AF),
                size: 18,
              ),
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF2D3748).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ],
        ),
      );
    }

    return TextField(
      controller: controller.tokenController,
      style: const TextStyle(color: Color(0xFFF9FAFB), fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Enter your Real Debrid API token',
        hintStyle: const TextStyle(color: Color(0xFF6B7280), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFF0F1419),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2D3748), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2D3748), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
      obscureText: !controller.isTokenEditable.value,
    );
  }

  Widget _buildTokenActions(SettingsController controller) {
    if (!controller.isTokenEditable.value) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: controller.disableTokenEditing,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF9CA3AF),
              side: const BorderSide(color: Color(0xFF2D3748)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: controller.isLoading.value ? null : controller.saveToken,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: controller.isLoading.value
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('Save Token'),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoAppSection(SettingsController controller) {
    return _buildSectionContainer(
      title: 'Default Video App',
      icon: Icons.video_library_rounded,
      iconColor: const Color(0xFF8B5CF6),
      child: Obx(() => _buildVideoAppDropdown(controller)),
    );
  }

  Widget _buildVideoAppDropdown(SettingsController controller) {
    if (controller.isVideoAppsLoading.value) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
            strokeWidth: 2,
          ),
        ),
      );
    }

    if (controller.availableVideoApps.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0F1419),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2D3748), width: 1),
        ),
        child: const Row(
          children: [
            Icon(Icons.info_rounded, color: Color(0xFFF59E0B), size: 18),
            SizedBox(width: 12),
            Text(
              'No video apps found on device',
              style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select your preferred video player',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF0F1419),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2D3748), width: 1),
          ),
          child: Builder(
            builder: (context) => Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Map<String, dynamic>>(
                  value: controller.selectedVideoApp.value,
                  dropdownColor: const Color(0xFF1F2937),
                  style: const TextStyle(
                    color: Color(0xFFF9FAFB),
                    fontSize: 14,
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D3748).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9CA3AF),
                        size: 16,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  itemHeight: 56,
                  borderRadius: BorderRadius.circular(12),
                  items: [
                    DropdownMenuItem<Map<String, dynamic>>(
                      value: null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6B7280).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.devices_rounded,
                                size: 16,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'System Default',
                                    style: TextStyle(
                                      color: Color(0xFFF9FAFB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Let the system choose',
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ...controller.availableVideoApps.map(
                      (app) => DropdownMenuItem<Map<String, dynamic>>(
                        value: app,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF8B5CF6,
                                  ).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.play_circle_outline_rounded,
                                  size: 16,
                                  color: Color(0xFF8B5CF6),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      app['appName'] ??
                                          app['packageName'] ??
                                          'Unknown App',
                                      style: const TextStyle(
                                        color: Color(0xFFF9FAFB),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (app['packageName'] != null &&
                                        app['appName'] != null)
                                      Text(
                                        app['packageName'],
                                        style: const TextStyle(
                                          color: Color(0xFF6B7280),
                                          fontSize: 11,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    controller.setDefaultVideoApp(value);
                  },
                  selectedItemBuilder: (context) => [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6B7280).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.devices_rounded,
                              size: 16,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'System Default',
                              style: TextStyle(
                                color: Color(0xFFF9FAFB),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...controller.availableVideoApps.map(
                      (app) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF8B5CF6).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.play_circle_outline_rounded,
                                size: 16,
                                color: Color(0xFF8B5CF6),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                app['appName'] ??
                                    app['packageName'] ??
                                    'Unknown App',
                                style: const TextStyle(
                                  color: Color(0xFFF9FAFB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
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
          ),
        ),
      ],
    );
  }

  Widget _buildDebugSection(SettingsController controller) {
    return _buildSectionContainer(
      title: 'Debug Tools',
      icon: Icons.developer_mode_rounded,
      iconColor: const Color(0xFFFF6B35),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: controller.showApiCalls,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFFF6B35),
            side: const BorderSide(color: Color(0xFFFF6B35), width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          icon: const Icon(Icons.bug_report_rounded, size: 18),
          label: const Text('View API Calls'),
        ),
      ),
    );
  }
}
