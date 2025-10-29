import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/presentation/controllers/add_torrents_controller.dart';
import 'package:rd_client/utils/utility_functions.dart';

class AddTorrentsScreen extends StatelessWidget {
  const AddTorrentsScreen({super.key, this.magnetLink, this.addedTorrent})
    : assert(
        magnetLink != null || addedTorrent != null,
        'Either magnetLink or addedTorrent must be provided',
      );

  final String? magnetLink;
  final Torrent? addedTorrent;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTorrentsController());

    // Initialize controller with the provided data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initialize(magnetLink, addedTorrent);
    });

    return _buildScreen(context, controller);
  }

  Widget _buildScreen(BuildContext context, AddTorrentsController controller) {
    final theme = Theme.of(context);
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFF181A20),
        appBar: AppBar(
          title: const Text('Add Torrent'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                elevation: 2,
              ),
              onPressed: controller.selectedFileIds.isNotEmpty
                  ? () => controller.addSelectedFiles(context)
                  : null,
              child: const Text("Add Selected Files"),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.cloud_download,
                      color: Colors.blue[300],
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        controller.addedTorrent.value?.filename ?? 'Loading...',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.sd_storage, color: Colors.grey[400], size: 20),
                    const SizedBox(width: 6),
                    Text(
                      'Size: ',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text(
                      UtilityFunctions.formatBytes(
                        controller.addedTorrent.value?.bytes ?? 0,
                      ),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.blue[200],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                if ((controller.addedTorrent.value?.files?.isNotEmpty ?? false))
                  Row(
                    children: [
                      Checkbox(
                        value: controller.selectAll.value,
                        activeColor: Colors.blue[300],
                        checkColor: Colors.black,
                        side: const BorderSide(color: Colors.white24),
                        onChanged: controller.toggleSelectAll,
                      ),
                      const Text(
                        'Select All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                if ((controller.addedTorrent.value?.files?.isNotEmpty ?? false))
                  const SizedBox(height: 8),
                Expanded(
                  child:
                      controller.isLoading.value ||
                          controller.addedTorrent.value?.files == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white70,
                          ),
                        )
                      : ListView.separated(
                          itemCount:
                              controller.addedTorrent.value!.files!.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            color: Color(0xFF23242B),
                          ),
                          itemBuilder: (context, index) {
                            final file =
                                controller.addedTorrent.value!.files![index];
                            final isSelected =
                                file.id != null &&
                                controller.selectedFileIds.contains(file.id);
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isSelected
                                    ? Colors.blue[900]?.withOpacity(0.18)
                                    : Colors.transparent,
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                title: Text(
                                  file.path.toString(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.blue[100]
                                        : Colors.white,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: Checkbox(
                                  value: isSelected,
                                  activeColor: Colors.blue[300],
                                  checkColor: Colors.black,
                                  side: const BorderSide(color: Colors.white24),
                                  onChanged: (value) => controller
                                      .toggleFileSelection(file.id, value),
                                ),
                                trailing: Chip(
                                  backgroundColor: Colors.blueGrey[900]
                                      ?.withOpacity(0.3),
                                  label: Text(
                                    UtilityFunctions.formatBytes(
                                      file.bytes ?? 0,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
