import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/presentation/screens/home_screen.dart';
import 'package:rd_client/services/api_service.dart';
import 'package:rd_client/utils/utility_functions.dart';

class AddTorrentsScreen extends StatefulWidget {
  const AddTorrentsScreen({super.key, required this.magnetLink});

  final String magnetLink;

  @override
  State<AddTorrentsScreen> createState() => _AddTorrentsScreenState();
}

class _AddTorrentsScreenState extends State<AddTorrentsScreen> {
  Torrent? addedTorrent;
  Set<int> selectedFileIds = {};
  bool selectAll = false;

  @override
  void initState() {
    fetchAddedTorrent();
    super.initState();
  }

  Future<void> fetchAddedTorrent() async {
    final id = await ApiService.instance.addTorrent(widget.magnetLink);

    addedTorrent = await ApiService.instance.getSingleTorrent(id.toString());
    setState(() {
      selectedFileIds.clear();
      selectAll = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
            onPressed: () {
              ApiService.instance
                  .addFilesToTorrent(
                    addedTorrent!.id.toString(),
                    selectedFileIds.join(','),
                  )
                  .then(
                    (_) => Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    ),
                  );
            },
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
                  Icon(Icons.cloud_download, color: Colors.blue[300], size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      addedTorrent?.filename ?? 'Loading...',
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
                    UtilityFunctions.formatBytes(addedTorrent?.bytes ?? 0),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.blue[200],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if ((addedTorrent?.files?.isNotEmpty ?? false))
                Row(
                  children: [
                    Checkbox(
                      value: selectAll,
                      activeColor: Colors.blue[300],
                      checkColor: Colors.black,
                      side: const BorderSide(color: Colors.white24),
                      onChanged: (value) {
                        setState(() {
                          selectAll = value ?? false;
                          if (selectAll) {
                            selectedFileIds = {
                              for (var f in addedTorrent!.files!)
                                if (f.id != null) f.id!,
                            };
                          } else {
                            selectedFileIds.clear();
                          }
                        });
                      },
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
              if ((addedTorrent?.files?.isNotEmpty ?? false))
                const SizedBox(height: 8),
              Expanded(
                child: addedTorrent?.files == null
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white70),
                      )
                    : ListView.separated(
                        itemCount: addedTorrent!.files!.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, color: Color(0xFF23242B)),
                        itemBuilder: (context, index) {
                          final file = addedTorrent!.files![index];
                          final isSelected =
                              file.id != null &&
                              selectedFileIds.contains(file.id);
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
                                onChanged: (value) {
                                  setState(() {
                                    if (file.id != null) {
                                      if (value == true) {
                                        selectedFileIds.add(file.id!);
                                      } else {
                                        selectedFileIds.remove(file.id!);
                                      }
                                      // Update selectAll state
                                      selectAll =
                                          selectedFileIds.length ==
                                          addedTorrent!.files!
                                              .where((f) => f.id != null)
                                              .length;
                                    }
                                  });
                                },
                              ),
                              trailing: Chip(
                                backgroundColor: Colors.blueGrey[900]
                                    ?.withOpacity(0.3),
                                label: Text(
                                  UtilityFunctions.formatBytes(file.bytes ?? 0),
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
    );
  }
}
