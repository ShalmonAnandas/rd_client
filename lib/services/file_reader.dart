import 'dart:typed_data';

import 'file_reader_stub.dart'
    if (dart.library.io) 'file_reader_io.dart'
    if (dart.library.html) 'file_reader_web.dart';

abstract class FileReader {
  Future<Uint8List> readBytes(String path);
}

FileReader getFileReader() => createFileReader();
