import 'package:freezed_annotation/freezed_annotation.dart';

part 'torrentio_stream_model.freezed.dart';
part 'torrentio_stream_model.g.dart';

@freezed
abstract class TorrentioStreamResponse with _$TorrentioStreamResponse {
  const factory TorrentioStreamResponse({List<TorrentioStream>? streams}) =
      _TorrentioStreamResponse;

  factory TorrentioStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$TorrentioStreamResponseFromJson(json);
}

@freezed
abstract class TorrentioStream with _$TorrentioStream {
  const factory TorrentioStream({
    String? name,
    String? title,
    String? url,
    @JsonKey(name: 'infoHash') String? infoHash,
    @JsonKey(name: 'fileIdx') int? fileIdx,
    @JsonKey(name: 'behaviorHints') BehaviorHints? behaviorHints,
  }) = _TorrentioStream;

  factory TorrentioStream.fromJson(Map<String, dynamic> json) =>
      _$TorrentioStreamFromJson(json);
}

@freezed
abstract class BehaviorHints with _$BehaviorHints {
  const factory BehaviorHints({
    @JsonKey(name: 'bingeGroup') String? bingeGroup,
    String? filename,
  }) = _BehaviorHints;

  factory BehaviorHints.fromJson(Map<String, dynamic> json) =>
      _$BehaviorHintsFromJson(json);
}
