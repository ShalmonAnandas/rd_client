// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unrestricted_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnrestrictedLinkModel _$UnrestrictedLinkModelFromJson(
  Map<String, dynamic> json,
) => _UnrestrictedLinkModel(
  id: json['id'] as String?,
  filename: json['filename'] as String?,
  mimeType: json['mimeType'] as String?,
  filesize: (json['filesize'] as num?)?.toInt(),
  link: json['link'] as String?,
  host: json['host'] as String?,
  hostIcon: json['host_icon'] as String?,
  chunks: (json['chunks'] as num?)?.toInt(),
  crc: (json['crc'] as num?)?.toInt(),
  download: json['download'] as String?,
  streamable: (json['streamable'] as num?)?.toInt(),
);

Map<String, dynamic> _$UnrestrictedLinkModelToJson(
  _UnrestrictedLinkModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'filename': instance.filename,
  'mimeType': instance.mimeType,
  'filesize': instance.filesize,
  'link': instance.link,
  'host': instance.host,
  'host_icon': instance.hostIcon,
  'chunks': instance.chunks,
  'crc': instance.crc,
  'download': instance.download,
  'streamable': instance.streamable,
};
