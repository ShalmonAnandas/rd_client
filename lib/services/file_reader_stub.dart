import 'dart:typed_data';

import 'file_reader.dart';

class _StubFileReader implements FileReader {
  @override
  Future<Uint8List> readBytes(String path) {
    throw UnsupportedError('Torrent file uploads are not supported.');
  }
}

FileReader createFileReader() => _StubFileReader();
