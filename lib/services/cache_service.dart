import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class CacheService {
  CacheService._();

  static final CacheService instance = CacheService._();

  Database? _database;
  final _mediaDetailsStore = stringMapStoreFactory.store('media_details');
  final _seasonDetailsStore = stringMapStoreFactory.store('season_details');
  final _torrentioStreamsStore = stringMapStoreFactory.store(
    'torrentio_streams',
  );

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    await appDocDir.create(recursive: true);
    final dbPath = join(appDocDir.path, 'cache.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  // Media Details Cache
  Future<void> cacheMediaDetails(String key, Map<String, dynamic> data) async {
    final db = await database;
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await _mediaDetailsStore.record(key).put(db, cacheData);
  }

  Future<Map<String, dynamic>?> getMediaDetails(
    String key, {
    Duration? maxAge,
  }) async {
    final db = await database;
    final record = await _mediaDetailsStore.record(key).get(db);

    if (record == null) return null;

    if (maxAge != null) {
      final timestamp = record['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > maxAge.inMilliseconds) {
        await _mediaDetailsStore.record(key).delete(db);
        return null;
      }
    }

    return record['data'] as Map<String, dynamic>?;
  }

  // Season Details Cache
  Future<void> cacheSeasonDetails(String key, Map<String, dynamic> data) async {
    final db = await database;
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await _seasonDetailsStore.record(key).put(db, cacheData);
  }

  Future<Map<String, dynamic>?> getSeasonDetails(
    String key, {
    Duration? maxAge,
  }) async {
    final db = await database;
    final record = await _seasonDetailsStore.record(key).get(db);

    if (record == null) return null;

    if (maxAge != null) {
      final timestamp = record['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > maxAge.inMilliseconds) {
        await _seasonDetailsStore.record(key).delete(db);
        return null;
      }
    }

    return record['data'] as Map<String, dynamic>?;
  }

  // Torrentio Streams Cache
  Future<void> cacheTorrentioStreams(
    String key,
    Map<String, dynamic> data,
  ) async {
    final db = await database;
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await _torrentioStreamsStore.record(key).put(db, cacheData);
  }

  Future<Map<String, dynamic>?> getTorrentioStreams(
    String key, {
    Duration? maxAge,
  }) async {
    final db = await database;
    final record = await _torrentioStreamsStore.record(key).get(db);

    if (record == null) return null;

    if (maxAge != null) {
      final timestamp = record['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > maxAge.inMilliseconds) {
        await _torrentioStreamsStore.record(key).delete(db);
        return null;
      }
    }

    return record['data'] as Map<String, dynamic>?;
  }

  // Clear all caches
  Future<void> clearAllCaches() async {
    final db = await database;
    await _mediaDetailsStore.delete(db);
    await _seasonDetailsStore.delete(db);
    await _torrentioStreamsStore.delete(db);
  }

  // Clear specific cache stores
  Future<void> clearMediaDetailsCache() async {
    final db = await database;
    await _mediaDetailsStore.delete(db);
  }

  Future<void> clearSeasonDetailsCache() async {
    final db = await database;
    await _seasonDetailsStore.delete(db);
  }

  Future<void> clearTorrentioStreamsCache() async {
    final db = await database;
    await _torrentioStreamsStore.delete(db);
  }
}
