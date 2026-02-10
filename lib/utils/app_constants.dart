import 'package:flutter/foundation.dart';
import 'package:rd_client/utils/alice_wrapper.dart';

class AppConstants {
  static String rdBaseUrl = 'https://api.real-debrid.com/rest/1.0';

  static String tmdbBaseUrl = 'https://streamline-be.vercel.app';

  static String? apiToken;

  static Alice alice = Alice(
    configuration: AliceConfiguration(
      showInspectorOnShake: !kIsWeb,
      showNotification: false,
    ),
  );
}
