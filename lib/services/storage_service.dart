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
}
