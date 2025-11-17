// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrentio_stream_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TorrentioStreamResponse _$TorrentioStreamResponseFromJson(
  Map<String, dynamic> json,
) => _TorrentioStreamResponse(
  streams: (json['streams'] as List<dynamic>?)
      ?.map((e) => TorrentioStream.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TorrentioStreamResponseToJson(
  _TorrentioStreamResponse instance,
) => <String, dynamic>{'streams': instance.streams};

_TorrentioStream _$TorrentioStreamFromJson(Map<String, dynamic> json) =>
    _TorrentioStream(
      name: json['name'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      infoHash: json['infoHash'] as String?,
      fileIdx: (json['fileIdx'] as num?)?.toInt(),
      behaviorHints: json['behaviorHints'] == null
          ? null
          : BehaviorHints.fromJson(
              json['behaviorHints'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TorrentioStreamToJson(_TorrentioStream instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'url': instance.url,
      'infoHash': instance.infoHash,
      'fileIdx': instance.fileIdx,
      'behaviorHints': instance.behaviorHints,
    };

_BehaviorHints _$BehaviorHintsFromJson(Map<String, dynamic> json) =>
    _BehaviorHints(
      bingeGroup: json['bingeGroup'] as String?,
      filename: json['filename'] as String?,
    );

Map<String, dynamic> _$BehaviorHintsToJson(_BehaviorHints instance) =>
    <String, dynamic>{
      'bingeGroup': instance.bingeGroup,
      'filename': instance.filename,
    };
