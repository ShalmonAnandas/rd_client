import 'sharing_intent_service_stub.dart'
    if (dart.library.io) 'sharing_intent_service_io.dart'
    if (dart.library.html) 'sharing_intent_service_web.dart';

class SharedFile {
  final String path;

  const SharedFile(this.path);
}

abstract class SharingIntentService {
  Future<List<SharedFile>> getInitialFiles();
  Stream<List<SharedFile>> getFileStream();
}

SharingIntentService getSharingIntentService() => createSharingIntentService();
