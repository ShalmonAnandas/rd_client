import 'package:freezed_annotation/freezed_annotation.dart';

part 'torrent.freezed.dart';
part 'torrent.g.dart';

@freezed
abstract class Torrent with _$Torrent {
  const factory Torrent({
    @JsonKey(name: "added") String? added,
    @JsonKey(name: "bytes") int? bytes,
    @JsonKey(name: "ended") String? ended,
    @JsonKey(name: "filename") String? filename,
    @JsonKey(name: "files") List<FileElement>? files,
    @JsonKey(name: "hash") String? hash,
    @JsonKey(name: "host") String? host,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "links") List<String>? links,
    @JsonKey(name: "original_bytes") int? originalBytes,
    @JsonKey(name: "original_filename") String? originalFilename,
    @JsonKey(name: "progress") int? progress,
    @JsonKey(name: "split") int? split,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "speed") int? speed,
    @JsonKey(name: "seeders") int? seeders,
  }) = _Torrent;

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);
}

@freezed
abstract class FileElement with _$FileElement {
  const factory FileElement({
    @JsonKey(name: "bytes") int? bytes,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "path") String? path,
    @JsonKey(name: "selected") int? selected,
  }) = _FileElement;

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);
}
