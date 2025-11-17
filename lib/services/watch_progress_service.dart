import 'package:sembast/sembast.dart';
import 'package:rd_client/services/cache_service.dart';

/// Model to represent watch progress
class WatchProgress {
  final String id; // Unique identifier for the video
  final String filename;
  final int position; // Position in milliseconds
  final int duration; // Total duration in milliseconds (if known)
  final DateTime lastWatched;
  final String? downloadUrl; // Store the download URL for resuming

  // Media metadata
  final String? posterPath; // Poster or backdrop image URL
  final String? mediaType; // 'movie', 'tv', 'torrent', 'stream'
  final String? mediaTitle; // Original media title
  final int? seasonNumber; // For TV shows
  final int? episodeNumber; // For TV shows
  final String? overview; // Media description

  WatchProgress({
    required this.id,
    required this.filename,
    required this.position,
    this.duration = 0,
    required this.lastWatched,
    this.downloadUrl,
    this.posterPath,
    this.mediaType,
    this.mediaTitle,
    this.seasonNumber,
    this.episodeNumber,
    this.overview,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'filename': filename,
    'position': position,
    'duration': duration,
    'lastWatched': lastWatched.toIso8601String(),
    'downloadUrl': downloadUrl,
    'posterPath': posterPath,
    'mediaType': mediaType,
    'mediaTitle': mediaTitle,
    'seasonNumber': seasonNumber,
    'episodeNumber': episodeNumber,
    'overview': overview,
  };

  factory WatchProgress.fromJson(Map<String, dynamic> json) => WatchProgress(
    id: json['id'] as String,
    filename: json['filename'] as String,
    position: json['position'] as int,
    duration: json['duration'] as int? ?? 0,
    lastWatched: DateTime.parse(json['lastWatched'] as String),
    downloadUrl: json['downloadUrl'] as String?,
    posterPath: json['posterPath'] as String?,
    mediaType: json['mediaType'] as String?,
    mediaTitle: json['mediaTitle'] as String?,
    seasonNumber: json['seasonNumber'] as int?,
    episodeNumber: json['episodeNumber'] as int?,
    overview: json['overview'] as String?,
  );

  /// Check if the video has been watched (>90% completion)
  bool get isWatched {
    if (duration == 0) return false;
    return (position / duration) > 0.9;
  }

  /// Get watch percentage
  double get watchPercentage {
    if (duration == 0) return 0;
    return (position / duration).clamp(0.0, 1.0);
  }
}

class WatchProgressService {
  WatchProgressService._();

  static final WatchProgressService instance = WatchProgressService._();

  final _watchProgressStore = stringMapStoreFactory.store('watch_progress');

  Future<Database> get _database => CacheService.instance.database;

  /// Save or update watch progress
  Future<void> saveWatchProgress(WatchProgress progress) async {
    final db = await _database;
    await _watchProgressStore.record(progress.id).put(db, progress.toJson());
  }

  /// Get watch progress for a specific video
  Future<WatchProgress?> getWatchProgress(String id) async {
    final db = await _database;
    final record = await _watchProgressStore.record(id).get(db);

    if (record == null) return null;

    return WatchProgress.fromJson(record);
  }

  /// Get all watch progress entries, sorted by last watched (most recent first)
  Future<List<WatchProgress>> getAllWatchProgress() async {
    final db = await _database;
    final records = await _watchProgressStore.find(db);

    final progressList = records
        .map((record) => WatchProgress.fromJson(record.value))
        .toList();

    progressList.sort((a, b) => b.lastWatched.compareTo(a.lastWatched));

    return progressList;
  }

  /// Get recently watched items (last 50)
  Future<List<WatchProgress>> getRecentlyWatched({int limit = 50}) async {
    final allProgress = await getAllWatchProgress();
    return allProgress.take(limit).toList();
  }

  /// Delete watch progress for a specific video
  Future<void> deleteWatchProgress(String id) async {
    final db = await _database;
    await _watchProgressStore.record(id).delete(db);
  }

  /// Clear all watch progress
  Future<void> clearAllWatchProgress() async {
    final db = await _database;
    await _watchProgressStore.delete(db);
  }

  /// Delete old watch progress entries (older than specified days)
  Future<void> deleteOldProgress({int olderThanDays = 90}) async {
    final db = await _database;
    final cutoffDate = DateTime.now().subtract(Duration(days: olderThanDays));
    final records = await _watchProgressStore.find(db);

    for (final record in records) {
      final progress = WatchProgress.fromJson(record.value);
      if (progress.lastWatched.isBefore(cutoffDate)) {
        await _watchProgressStore.record(progress.id).delete(db);
      }
    }
  }

  /// Mark a video as watched (sets position to duration)
  Future<void> markAsWatched(String id) async {
    final progress = await getWatchProgress(id);
    if (progress != null) {
      final updatedProgress = WatchProgress(
        id: progress.id,
        filename: progress.filename,
        position: progress.duration,
        duration: progress.duration,
        lastWatched: DateTime.now(),
        downloadUrl: progress.downloadUrl,
      );
      await saveWatchProgress(updatedProgress);
    }
  }

  /// Generate a unique ID from a download URL
  static String generateIdFromUrl(String url) {
    return url.hashCode.abs().toString();
  }
}
