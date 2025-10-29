import 'package:flutter/services.dart';

class VideoAppsService {
  static const MethodChannel _channel = MethodChannel(
    'dev.shalmon.rdclient/video_apps',
  );

  /// Retrieves a list of all installed video player apps on the device
  /// Returns a list of maps containing app information:
  /// - packageName: The app's package identifier
  /// - appName: The display name of the app
  /// - isSystemApp: Whether the app is a system app
  static Future<List<Map<String, dynamic>>> getInstalledVideoApps() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'getInstalledVideoApps',
      );
      return result.map((dynamic item) {
        final Map<Object?, Object?> rawMap = item as Map<Object?, Object?>;
        return Map<String, dynamic>.from(rawMap);
      }).toList();
    } on PlatformException catch (e) {
      throw Exception('Failed to get installed video apps: ${e.message}');
    }
  }

  /// Checks if a specific video app is installed
  static Future<bool> isVideoAppInstalled(String packageName) async {
    try {
      final apps = await getInstalledVideoApps();
      return apps.any((app) => app['packageName'] == packageName);
    } catch (e) {
      return false;
    }
  }

  /// Gets only third-party (non-system) video apps
  static Future<List<Map<String, dynamic>>> getThirdPartyVideoApps() async {
    try {
      final apps = await getInstalledVideoApps();
      return apps.where((app) => app['isSystemApp'] != '1').toList();
    } catch (e) {
      throw Exception('Failed to get third-party video apps: $e');
    }
  }
}
