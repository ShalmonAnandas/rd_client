import 'dart:io';
import 'dart:typed_data';

import 'file_reader.dart';

class _IoFileReader implements FileReader {
  @override
  Future<Uint8List> readBytes(String path) {
    return File(path).readAsBytes();
  }
}

FileReader createFileReader() => _IoFileReader();
