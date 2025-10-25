// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Torrent _$TorrentFromJson(Map<String, dynamic> json) => _Torrent(
  added: json['added'] as String?,
  bytes: (json['bytes'] as num?)?.toInt(),
  ended: json['ended'] as String?,
  filename: json['filename'] as String?,
  files: (json['files'] as List<dynamic>?)
      ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
      .toList(),
  hash: json['hash'] as String?,
  host: json['host'] as String?,
  id: json['id'] as String?,
  links: (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
  originalBytes: (json['original_bytes'] as num?)?.toInt(),
  originalFilename: json['original_filename'] as String?,
  progress: (json['progress'] as num?)?.toInt(),
  split: (json['split'] as num?)?.toInt(),
  status: json['status'] as String?,
  speed: (json['speed'] as num?)?.toInt(),
  seeders: (json['seeders'] as num?)?.toInt(),
);

Map<String, dynamic> _$TorrentToJson(_Torrent instance) => <String, dynamic>{
  'added': instance.added,
  'bytes': instance.bytes,
  'ended': instance.ended,
  'filename': instance.filename,
  'files': instance.files,
  'hash': instance.hash,
  'host': instance.host,
  'id': instance.id,
  'links': instance.links,
  'original_bytes': instance.originalBytes,
  'original_filename': instance.originalFilename,
  'progress': instance.progress,
  'split': instance.split,
  'status': instance.status,
  'speed': instance.speed,
  'seeders': instance.seeders,
};

_FileElement _$FileElementFromJson(Map<String, dynamic> json) => _FileElement(
  bytes: (json['bytes'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  path: json['path'] as String?,
  selected: (json['selected'] as num?)?.toInt(),
);

Map<String, dynamic> _$FileElementToJson(_FileElement instance) =>
    <String, dynamic>{
      'bytes': instance.bytes,
      'id': instance.id,
      'path': instance.path,
      'selected': instance.selected,
    };
