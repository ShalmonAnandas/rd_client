import 'sharing_intent_service.dart';

class _WebSharingIntentService implements SharingIntentService {
  @override
  Future<List<SharedFile>> getInitialFiles() async => const [];

  @override
  Stream<List<SharedFile>> getFileStream() =>
      const Stream<List<SharedFile>>.empty();
}

SharingIntentService createSharingIntentService() =>
    _WebSharingIntentService();
