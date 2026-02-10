import 'package:flutter/foundation.dart';
import 'package:rd_client/utils/alice_wrapper.dart';

class AppConstants {
  static String rdBaseUrl = 'https://api.real-debrid.com/rest/1.0';
  static String torboxBaseUrl = 'https://api.torbox.app/v1/api';

  static String tmdbBaseUrl = 'https://streamline-be.vercel.app';

  static String? apiToken;
  static const String realDebridProvider = 'realdebrid';
  static const String torboxProvider = 'torbox';
  static String debridProvider = realDebridProvider;

  static String get debridDisplayName =>
      debridProvider == torboxProvider ? 'TorBox' : 'Real Debrid';

  static String get debridStatusLabel =>
      debridProvider == torboxProvider ? 'TorBox' : 'RD+';

  static String get debridReferer =>
      debridProvider == torboxProvider
          ? 'https://torbox.app/'
          : 'https://real-debrid.com/';

  static Alice alice = Alice(
    configuration: AliceConfiguration(
      showInspectorOnShake: !kIsWeb,
      showNotification: false,
    ),
  );
}
