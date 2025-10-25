import 'package:freezed_annotation/freezed_annotation.dart';

part 'unrestricted_link_model.freezed.dart';
part 'unrestricted_link_model.g.dart';

@freezed
abstract class UnrestrictedLinkModel with _$UnrestrictedLinkModel {
  const factory UnrestrictedLinkModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "filename") String? filename,
    @JsonKey(name: "mimeType") String? mimeType,
    @JsonKey(name: "filesize") int? filesize,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "host") String? host,
    @JsonKey(name: "host_icon") String? hostIcon,
    @JsonKey(name: "chunks") int? chunks,
    @JsonKey(name: "crc") int? crc,
    @JsonKey(name: "download") String? download,
    @JsonKey(name: "streamable") int? streamable,
  }) = _UnrestrictedLinkModel;

  factory UnrestrictedLinkModel.fromJson(Map<String, dynamic> json) =>
      _$UnrestrictedLinkModelFromJson(json);
}
