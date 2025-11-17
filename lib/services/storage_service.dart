import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage storage;

  StorageService._internal() : storage = const FlutterSecureStorage();
  static final StorageService _instance = StorageService._internal();
  static StorageService get instance => _instance;

  Future<void> storeToken(String token) async {
    await storage.write(key: 'rd_auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'rd_auth_token');
  }

  Future<void> storeDefaultVideoApp(String packageName) async {
    await storage.write(key: 'default_video_app', value: packageName);
  }

  Future<String?> getDefaultVideoApp() async {
    return await storage.read(key: 'default_video_app');
  }

  Future<void> removeDefaultVideoApp() async {
    await storage.delete(key: 'default_video_app');
  }

  // Torrentio Configuration
  Future<void> storeTorrentioProviders(String providers) async {
    await storage.write(key: 'torrentio_providers', value: providers);
  }

  Future<String?> getTorrentioProviders() async {
    return await storage.read(key: 'torrentio_providers');
  }

  Future<void> storeTorrentioQualityFilter(String quality) async {
    await storage.write(key: 'torrentio_quality', value: quality);
  }

  Future<String?> getTorrentioQualityFilter() async {
    return await storage.read(key: 'torrentio_quality');
  }

  Future<void> storeTorrentioSort(String sort) async {
    await storage.write(key: 'torrentio_sort', value: sort);
  }

  Future<String?> getTorrentioSort() async {
    return await storage.read(key: 'torrentio_sort');
  }

  Future<void> storeTorrentioLanguage(String language) async {
    await storage.write(key: 'torrentio_language', value: language);
  }

  Future<String?> getTorrentioLanguage() async {
    return await storage.read(key: 'torrentio_language');
  }

  Future<void> storeTorrentioExclude(String exclude) async {
    await storage.write(key: 'torrentio_exclude', value: exclude);
  }

  Future<String?> getTorrentioExclude() async {
    return await storage.read(key: 'torrentio_exclude');
  }
}
