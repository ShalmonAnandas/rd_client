import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'sharing_intent_service.dart';

class _IoSharingIntentService implements SharingIntentService {
  @override
  Future<List<SharedFile>> getInitialFiles() async {
    final files = await ReceiveSharingIntent.instance.getInitialMedia();
    return files.map((file) => SharedFile(file.path)).toList();
  }

  @override
  Stream<List<SharedFile>> getFileStream() {
    return ReceiveSharingIntent.instance.getMediaStream().map(
          (files) => files.map((file) => SharedFile(file.path)).toList(),
        );
  }
}

SharingIntentService createSharingIntentService() =>
    _IoSharingIntentService();
