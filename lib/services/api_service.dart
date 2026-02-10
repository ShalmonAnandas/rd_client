import 'dart:convert';

import 'package:rd_client/services/alice_dio_adapter_stub.dart'
    if (dart.library.io) 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rd_client/models/media_details_model.dart';
import 'package:rd_client/models/media_model.dart';
import 'package:rd_client/models/season_model.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/torrentio_stream_model.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
import 'package:rd_client/services/cache_service.dart';
import 'package:rd_client/services/file_reader.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/app_constants.dart';
import 'package:path/path.dart' as path;

class ApiService {
  ApiService._() {
    _dio.options = BaseOptions(
      headers: {'Authorization': 'Bearer ${AppConstants.apiToken}'},
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    if (!kIsWeb) {
      AliceDioAdapter aliceAdapter = AliceDioAdapter();
      AppConstants.alice.addAdapter(aliceAdapter);
      _dio.interceptors.add(aliceAdapter);
    }
  }

  static final ApiService instance = ApiService._();

  final Dio _dio = Dio();

  final Map<String, UnrestrictedLinkModel> unrestrictedLinkCache = {};

  bool get _isTorbox =>
      AppConstants.debridProvider == AppConstants.torboxProvider;

  void _applyAuthHeader() {
    _dio.options.headers = {
      'Authorization': 'Bearer ${AppConstants.apiToken ?? ''}',
    };
  }

  int? _convertToInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  String _mapTorboxStatus(String? status) {
    final normalized = status?.toLowerCase();
    if (normalized == 'cached' || normalized == 'completed') {
      return 'downloaded';
    }
    if (normalized == 'uploading') {
      return 'uploading';
    }
    if (normalized == 'downloading' ||
        normalized == 'metadl' ||
        normalized == 'checkingresumedata' ||
        (normalized?.startsWith('stalled') ?? false)) {
      return 'downloading';
    }
    return status ?? 'unknown';
  }

  /// Builds an internal TorBox link reference in the format:
  /// torbox|{torrentId}|{fileId}|{encodedName}|{size}
  /// where encodedName is a base64url-encoded filename and size may be empty.
  String _buildTorboxLink(String? torrentId, FileElement file) {
    final encodedName =
        base64UrlEncode(utf8.encode(file.path ?? ''));
    final size = file.bytes?.toString() ?? '';
    return 'torbox|${torrentId ?? ''}|${file.id ?? ''}|$encodedName|$size';
  }

  _TorboxLinkData? _parseTorboxLink(String link) {
    final delimiter =
        link.startsWith('torbox|')
            ? '|'
            : link.startsWith('torbox:')
            ? ':'
            : null;
    if (delimiter == null) {
      return null;
    }
    final parts = link.split(delimiter);
    if (parts.length < 4) {
      return null;
    }
    final torrentId = parts[1];
    final fileId = parts[2];
    final hasSize = parts.length > 4;
    final size = hasSize ? parts.last : '';
    final nameStartIndex = 3;
    final nameEndIndex = hasSize ? parts.length - 1 : parts.length;
    final encodedName =
        parts.sublist(nameStartIndex, nameEndIndex).join(delimiter);
    final filename = _decodeTorboxFilename(encodedName);
    return _TorboxLinkData(
      torrentId: torrentId,
      fileId: fileId,
      filename: filename,
      size: _convertToInt(size) ?? 0,
    );
  }

  String _decodeTorboxFilename(String encodedName) {
    if (encodedName.isEmpty) {
      return '';
    }
    try {
      return utf8.decode(base64Url.decode(encodedName));
    } catch (e) {
      debugPrint('Failed to decode TorBox filename: $e');
      return Uri.decodeComponent(encodedName);
    }
  }

  /// Maps TorBox torrent payload fields into the app's Torrent model.
  /// Uses TorBox's name/size/status/progress fields and converts files
  /// into FileElement records with TorBox download references.
  Torrent _mapTorboxTorrent(Map<String, dynamic> item) {
    final files = (item['files'] as List?)
        ?.map(
          (file) => FileElement(
            id: _convertToInt(file['id']),
            path: file['name']?.toString(),
            bytes: _convertToInt(file['size']),
            selected: 1,
          ),
        )
        .toList();
    final torrentId = item['id']?.toString();
    final links =
        files
            ?.where((file) => file.id != null)
            .map((file) => _buildTorboxLink(torrentId, file))
            .toList();
    return Torrent(
      id: torrentId,
      filename: item['name']?.toString(),
      bytes: _convertToInt(item['size']),
      status: _mapTorboxStatus(item['download_state']?.toString()),
      progress: _convertToInt(item['progress']),
      speed: _convertToInt(item['download_speed']),
      seeders: _convertToInt(item['seeds']),
      added: item['created_at']?.toString(),
      hash: item['hash']?.toString(),
      files: files,
      links: links,
    );
  }

  Future<List<Torrent>> getTorrentList() async {
    try {
      _applyAuthHeader();
      if (_isTorbox) {
        final response =
            await _dio.get('${AppConstants.torboxBaseUrl}/torrents/mylist');
        final data = response.data is Map<String, dynamic>
            ? response.data['data']
            : null;
        if (data is List) {
          return data
              .whereType<Map<String, dynamic>>()
              .map(_mapTorboxTorrent)
              .toList();
        }
        return [];
      }

      final response = await _dio.get('${AppConstants.rdBaseUrl}/torrents');

      List<Torrent> torrents = [];

      for (var item in response.data) {
        torrents.add(Torrent.fromJson(item));
      }

      return torrents;
    } catch (e) {
      rethrow;
    }
  }

  Future<Torrent> getSingleTorrent(String id) async {
    try {
      _applyAuthHeader();
      if (_isTorbox) {
        final response = await _dio.get(
          '${AppConstants.torboxBaseUrl}/torrents/mylist',
          queryParameters: {'id': id},
        );
        final data = response.data is Map<String, dynamic>
            ? response.data['data']
            : null;
        if (data is List && data.isNotEmpty) {
          return _mapTorboxTorrent(data.first as Map<String, dynamic>);
        }
        if (data is Map<String, dynamic>) {
          return _mapTorboxTorrent(data);
        }
        return Torrent();
      }

      final response = await _dio.get(
        '${AppConstants.rdBaseUrl}/torrents/info/$id',
      );

      return Torrent.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UnrestrictedLinkModel> getUnrestrictedLink(String link) async {
    try {
      if (unrestrictedLinkCache.containsKey(link)) {
        return unrestrictedLinkCache[link]!;
      }

      _applyAuthHeader();
      if (_isTorbox) {
        final linkData = _parseTorboxLink(link);
        if (linkData == null) {
          throw Exception('Invalid TorBox download reference');
        }
        final response = await _dio.get(
          '${AppConstants.torboxBaseUrl}/torrents/requestdl',
          queryParameters: {
            // TorBox requestdl requires the API token as a query parameter.
            'token': AppConstants.apiToken,
            'torrent_id': linkData.torrentId,
            'file_id': linkData.fileId,
          },
        );
        final downloadUrl =
            response.data is Map<String, dynamic> ? response.data['data'] : null;
        if (downloadUrl == null || downloadUrl.toString().isEmpty) {
          throw Exception('Failed to request TorBox download link');
        }
        final unrestrictedLink = UnrestrictedLinkModel(
          id: linkData.fileId,
          filename: linkData.filename,
          filesize: linkData.size,
          download: downloadUrl.toString(),
          streamable: 1,
          host: 'TorBox',
        );
        unrestrictedLinkCache[link] = unrestrictedLink;
        return unrestrictedLink;
      }

      final response = await _dio.post(
        '${AppConstants.rdBaseUrl}/unrestrict/link',
        data: FormData.fromMap({'link': link}),
      );

      final unrestrictedLink = UnrestrictedLinkModel.fromJson(response.data);
      unrestrictedLinkCache[link] = unrestrictedLink;
      return unrestrictedLink;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> addMagnet(String magnetUrl) async {
    try {
      _applyAuthHeader();
      if (_isTorbox) {
        final response = await _dio.post(
          '${AppConstants.torboxBaseUrl}/torrents/createtorrent',
          data: FormData.fromMap({'magnet': magnetUrl}),
        );
        return response.data['data']?['torrent_id']?.toString();
      }

      final response = await _dio.post(
        '${AppConstants.rdBaseUrl}/torrents/addMagnet',
        data: FormData.fromMap({'magnet': magnetUrl}),
      );

      return response.data['id']?.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> addTorrent(String filePath) async {
    try {
      if (kIsWeb) {
        throw UnsupportedError('Torrent file uploads are not supported on web');
      }
      _applyAuthHeader();
      // Read the file as raw bytes
      final file = await getFileReader().readBytes(filePath);
      if (_isTorbox) {
        final response = await _dio.post(
          '${AppConstants.torboxBaseUrl}/torrents/createtorrent',
          data: FormData.fromMap({
            'file': MultipartFile.fromBytes(
              file,
              filename: path.basename(filePath),
            ),
          }),
        );
        return response.data['data']?['torrent_id']?.toString();
      }

      final response = await _dio.put(
        '${AppConstants.rdBaseUrl}/torrents/addTorrent',
        data: file,
        options: Options(headers: {'Content-Type': 'application/x-bittorrent'}),
      );

      return response.data['id']?.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTorrent(String id) async {
    try {
      _applyAuthHeader();
      if (_isTorbox) {
        await _dio.post(
          '${AppConstants.torboxBaseUrl}/torrents/controltorrent',
          data: {'torrent_id': id, 'operation': 'delete'},
          options: Options(contentType: Headers.jsonContentType),
        );
        return;
      }

      await _dio.delete(
        '${AppConstants.rdBaseUrl}/torrents/delete/$id',
        data: FormData.fromMap({}),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFilesToTorrent(String torrentId, String fileIds) async {
    try {
      _applyAuthHeader();
      if (_isTorbox) {
        return;
      }
      await _dio.post(
        '${AppConstants.rdBaseUrl}/torrents/selectFiles/$torrentId',
        data: FormData.fromMap({'files': fileIds}),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MediaModel>> searchMedia(String query) async {
    try {
      final result = await _dio.get(
        '${AppConstants.tmdbBaseUrl}/search/multi?query=$query',
      );

      if (result.data['results'] != null && result.data['results'].isNotEmpty) {
        List<MediaModel> mediaList = [];
        for (var item in result.data['results']) {
          mediaList.add(MediaModel.fromJson(item));
        }
        return mediaList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MediaDetailsModel> getMediaDetails({
    required String mediaType,
    required int mediaId,
  }) async {
    try {
      // Check cache first
      final cacheKey = 'media_${mediaType}_$mediaId';
      final cachedData = await CacheService.instance.getMediaDetails(
        cacheKey,
        maxAge: const Duration(days: 7),
      );

      if (cachedData != null) {
        return MediaDetailsModel.fromJson(cachedData);
      }

      // Fetch from API if not cached
      final result = await _dio.get(
        '${AppConstants.tmdbBaseUrl}/details/$mediaType/$mediaId',
      );

      // Cache the result
      await CacheService.instance.cacheMediaDetails(cacheKey, result.data);

      return MediaDetailsModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SeasonModel> getSeasonDetails({
    required int tvShowId,
    required int seasonNumber,
  }) async {
    try {
      // Check cache first
      final cacheKey = 'season_${tvShowId}_$seasonNumber';
      final cachedData = await CacheService.instance.getSeasonDetails(
        cacheKey,
        maxAge: const Duration(days: 7),
      );

      if (cachedData != null) {
        return SeasonModel.fromJson(cachedData);
      }

      // Fetch from API if not cached
      final result = await _dio.get(
        '${AppConstants.tmdbBaseUrl}/tv/$tvShowId/season/$seasonNumber',
      );

      // Cache the result
      await CacheService.instance.cacheSeasonDetails(cacheKey, result.data);

      return SeasonModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TorrentioStreamResponse> getTorrentioStreams({
    required String mediaType,
    required String imdbId,
    int? season,
    int? episode,
  }) async {
    try {
      _applyAuthHeader();
      // Build the ID based on type
      String streamId;
      if (mediaType == 'movie') {
        streamId = imdbId;
      } else {
        // For TV shows: imdb_id:season:episode
        if (season == null || episode == null) {
          throw Exception('Season and episode are required for TV shows');
        }
        streamId = '$imdbId:$season:$episode';
      }

      // Check cache first
      final provider =
          await StorageService.instance.getDebridProvider() ??
          AppConstants.debridProvider;
      final cacheKey = 'torrentio_${provider}_${mediaType}_$streamId';
      final cachedData = await CacheService.instance.getTorrentioStreams(
        cacheKey,
        maxAge: const Duration(hours: 6),
      );

      if (cachedData != null) {
        return TorrentioStreamResponse.fromJson(cachedData);
      }

      // Build the configuration with RD API key and user settings
      final token = await StorageService.instance.getTokenForProvider(provider);
      final debridKey =
          provider == AppConstants.torboxProvider
              ? AppConstants.torboxProvider
              : AppConstants.realDebridProvider;
      final configParts = ['${debridKey}=${token ?? ''}'];

      // Add providers
      final providers = await StorageService.instance.getTorrentioProviders();
      if (providers != null && providers.isNotEmpty) {
        configParts.add(providers);
      }

      // Add quality filter
      final quality = await StorageService.instance.getTorrentioQualityFilter();
      if (quality != null && quality.isNotEmpty) {
        configParts.add(quality);
      }

      // Add sort option
      final sort = await StorageService.instance.getTorrentioSort();
      if (sort != null && sort.isNotEmpty) {
        configParts.add('sort=$sort');
      }

      // Add language filter
      final language = await StorageService.instance.getTorrentioLanguage();
      if (language != null && language.isNotEmpty) {
        configParts.add('language=$language');
      }

      // Add exclusions
      final exclude = await StorageService.instance.getTorrentioExclude();
      if (exclude != null && exclude.isNotEmpty) {
        configParts.add(exclude);
      }

      final config = configParts.join('|');

      // Construct the URL
      final url =
          'https://torrentio.strem.fun/$config/stream/$mediaType/$streamId.json';

      final response = await _dio.get(url);

      // Cache the result
      await CacheService.instance.cacheTorrentioStreams(
        cacheKey,
        response.data,
      );

      return TorrentioStreamResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

class _TorboxLinkData {
  final String torrentId;
  final String fileId;
  final String filename;
  final int size;

  const _TorboxLinkData({
    required this.torrentId,
    required this.fileId,
    required this.filename,
    required this.size,
  });
}
