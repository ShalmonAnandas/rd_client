import 'package:flutter/foundation.dart';
import 'package:rd_client/utils/alice_wrapper.dart';

class AppConstants {
  static String rdBaseUrl = 'https://api.real-debrid.com/rest/1.0';
  static String torboxBaseUrl = 'https://api.torbox.app/v1/api';

  static String tmdbBaseUrl = 'https://streamline-be.vercel.app';

  static String? apiToken;
  static String? rdToken;
  static String? torboxToken;
  static const String realDebridProvider = 'realdebrid';
  static const String torboxProvider = 'torbox';
  static String debridProvider = realDebridProvider;
  static const Map<String, String> debridProviderLabels = {
    realDebridProvider: 'Real Debrid',
    torboxProvider: 'TorBox',
  };

  static bool get hasRdToken => rdToken != null && rdToken!.isNotEmpty;
  static bool get hasTorboxToken =>
      torboxToken != null && torboxToken!.isNotEmpty;
  static bool get hasBothProviders => hasRdToken && hasTorboxToken;
  static bool get hasAnyToken => hasRdToken || hasTorboxToken;

  static String? getTokenForProvider(String provider) {
    if (provider == torboxProvider) return torboxToken;
    return rdToken;
  }

  static String get debridDisplayName =>
      debridProviderLabels[debridProvider] ?? 'Real Debrid';

  static String get debridStatusLabel =>
      debridProvider == torboxProvider ? 'TorBox' : 'RD+';

  static String get debridReferer =>
      debridProvider == torboxProvider
          ? 'https://torbox.app/'
          : 'https://real-debrid.com/';

  static const List<String> torrentioCacheMarkers = [
    '[RD+]',
    '[TB+]',
    '[TorBox+]',
    '[TBOX+]',
  ];

  static Alice alice = Alice(
    configuration: AliceConfiguration(
      showInspectorOnShake: !kIsWeb,
      showNotification: false,
    ),
  );
}
