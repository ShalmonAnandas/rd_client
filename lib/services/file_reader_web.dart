import 'dart:typed_data';

import 'file_reader.dart';

class _WebFileReader implements FileReader {
  @override
  Future<Uint8List> readBytes(String path) {
    throw UnsupportedError('Torrent file uploads are not supported on web.');
  }
}

FileReader createFileReader() => _WebFileReader();
