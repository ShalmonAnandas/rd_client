import 'dart:io';

import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rd_client/models/media_model.dart';
import 'package:rd_client/models/torrent.dart';
import 'package:rd_client/models/unrestricted_link_model.dart';
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
}
