Future<void> launchVideoImpl({
  required String url,
  String? defaultVideoApp,
  String? referer,
}) async {
  throw UnsupportedError('Video launch is not supported on this platform: $url');
}
