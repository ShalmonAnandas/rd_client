import 'dart:io';

import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rd_client/models/media_details_model.dart';
import 'package:rd_client/models/media_model.dart';
import 'package:rd_client/models/season_model.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/torrentio_stream_model.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
import 'package:rd_client/services/cache_service.dart';
import 'package:rd_client/services/storage_service.dart';
import 'package:rd_client/utils/app_constants.dart';

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

    AliceDioAdapter aliceAdapter = AliceDioAdapter();

    AppConstants.alice.addAdapter(aliceAdapter);

    _dio.interceptors.add(aliceAdapter);
  }

  static final ApiService instance = ApiService._();

  final Dio _dio = Dio();

  final Map<String, UnrestrictedLinkModel> unrestrictedLinkCache = {};

  Future<List<Torrent>> getTorrentList() async {
    try {
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
      // Read the file as raw bytes
      final file = await File(filePath).readAsBytes();

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
      final cacheKey = 'torrentio_${mediaType}_$streamId';
      final cachedData = await CacheService.instance.getTorrentioStreams(
        cacheKey,
        maxAge: const Duration(hours: 6),
      );

      if (cachedData != null) {
        return TorrentioStreamResponse.fromJson(cachedData);
      }

      // Build the configuration with RD API key and user settings
      final configParts = ['realdebrid=${AppConstants.apiToken}'];

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
