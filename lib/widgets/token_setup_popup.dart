import 'package:flutter/material.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/app_constants.dart';

class TokenSetupPopup extends StatefulWidget {
  const TokenSetupPopup({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return const TokenSetupPopup();
      },
    );
  }

  @override
  State<TokenSetupPopup> createState() => _TokenSetupPopupState();
}

class _TokenSetupPopupState extends State<TokenSetupPopup> {
  final TextEditingController _controller = TextEditingController();
  bool isEnabled = true;

  @override
  void initState() {
    StorageService.instance.getToken().then((token) {
      _controller.text = token ?? '';
      if (token != null && token.isNotEmpty) {
        setState(() {
          isEnabled = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: bottomPadding > 0 ? bottomPadding : 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'API Configuration',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          !isEnabled
              ? Row(
                  children: [
                    Expanded(child: Text(_controller.text)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEnabled = true;
                          _controller.text = '';
                        });
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                )
              : TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Real Debrid API TOKEN',
                  ),
                  autofocus: true,
                ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  StorageService.instance.storeToken(_controller.text.trim());
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  AppConstants.alice.showInspector();
                },
                child: const Text('API Calls'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
