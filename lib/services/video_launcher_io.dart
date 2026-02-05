import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchVideoImpl({
  required String url,
  String? defaultVideoApp,
  String? referer,
}) async {
  if (Platform.isAndroid) {
    final intent = AndroidIntent(
      action: 'action_view',
      data: url,
      package: defaultVideoApp,
      type: 'video/*',
      arguments: {
        'headers': {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          if (referer != null) 'Referer': referer,
        },
      },
    );
    await intent.launch();
    return;
  }

  final uri = Uri.parse(url);
  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched) {
    throw Exception('Could not launch video');
  }
}
