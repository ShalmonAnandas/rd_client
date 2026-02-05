import 'video_launcher_stub.dart'
    if (dart.library.io) 'video_launcher_io.dart'
    if (dart.library.html) 'video_launcher_web.dart';

Future<void> launchVideo({
  required String url,
  String? defaultVideoApp,
  String? referer,
}) =>
    launchVideoImpl(
      url: url,
      defaultVideoApp: defaultVideoApp,
      referer: referer,
    );
