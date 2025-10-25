// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unrestricted_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnrestrictedLinkModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "filename") String? get filename;@JsonKey(name: "mimeType") String? get mimeType;@JsonKey(name: "filesize") int? get filesize;@JsonKey(name: "link") String? get link;@JsonKey(name: "host") String? get host;@JsonKey(name: "host_icon") String? get hostIcon;@JsonKey(name: "chunks") int? get chunks;@JsonKey(name: "crc") int? get crc;@JsonKey(name: "download") String? get download;@JsonKey(name: "streamable") int? get streamable;
/// Create a copy of UnrestrictedLinkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnrestrictedLinkModelCopyWith<UnrestrictedLinkModel> get copyWith => _$UnrestrictedLinkModelCopyWithImpl<UnrestrictedLinkModel>(this as UnrestrictedLinkModel, _$identity);

  /// Serializes this UnrestrictedLinkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnrestrictedLinkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.link, link) || other.link == link)&&(identical(other.host, host) || other.host == host)&&(identical(other.hostIcon, hostIcon) || other.hostIcon == hostIcon)&&(identical(other.chunks, chunks) || other.chunks == chunks)&&(identical(other.crc, crc) || other.crc == crc)&&(identical(other.download, download) || other.download == download)&&(identical(other.streamable, streamable) || other.streamable == streamable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,mimeType,filesize,link,host,hostIcon,chunks,crc,download,streamable);

@override
String toString() {
  return 'UnrestrictedLinkModel(id: $id, filename: $filename, mimeType: $mimeType, filesize: $filesize, link: $link, host: $host, hostIcon: $hostIcon, chunks: $chunks, crc: $crc, download: $download, streamable: $streamable)';
}


}

/// @nodoc
abstract mixin class $UnrestrictedLinkModelCopyWith<$Res>  {
  factory $UnrestrictedLinkModelCopyWith(UnrestrictedLinkModel value, $Res Function(UnrestrictedLinkModel) _then) = _$UnrestrictedLinkModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "filename") String? filename,@JsonKey(name: "mimeType") String? mimeType,@JsonKey(name: "filesize") int? filesize,@JsonKey(name: "link") String? link,@JsonKey(name: "host") String? host,@JsonKey(name: "host_icon") String? hostIcon,@JsonKey(name: "chunks") int? chunks,@JsonKey(name: "crc") int? crc,@JsonKey(name: "download") String? download,@JsonKey(name: "streamable") int? streamable
});




}
/// @nodoc
class _$UnrestrictedLinkModelCopyWithImpl<$Res>
    implements $UnrestrictedLinkModelCopyWith<$Res> {
  _$UnrestrictedLinkModelCopyWithImpl(this._self, this._then);

  final UnrestrictedLinkModel _self;
  final $Res Function(UnrestrictedLinkModel) _then;

/// Create a copy of UnrestrictedLinkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? filename = freezed,Object? mimeType = freezed,Object? filesize = freezed,Object? link = freezed,Object? host = freezed,Object? hostIcon = freezed,Object? chunks = freezed,Object? crc = freezed,Object? download = freezed,Object? streamable = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,filesize: freezed == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,hostIcon: freezed == hostIcon ? _self.hostIcon : hostIcon // ignore: cast_nullable_to_non_nullable
as String?,chunks: freezed == chunks ? _self.chunks : chunks // ignore: cast_nullable_to_non_nullable
as int?,crc: freezed == crc ? _self.crc : crc // ignore: cast_nullable_to_non_nullable
as int?,download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as String?,streamable: freezed == streamable ? _self.streamable : streamable // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UnrestrictedLinkModel].
extension UnrestrictedLinkModelPatterns on UnrestrictedLinkModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnrestrictedLinkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnrestrictedLinkModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnrestrictedLinkModel value)  $default,){
final _that = this;
switch (_that) {
case _UnrestrictedLinkModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnrestrictedLinkModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnrestrictedLinkModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "mimeType")  String? mimeType, @JsonKey(name: "filesize")  int? filesize, @JsonKey(name: "link")  String? link, @JsonKey(name: "host")  String? host, @JsonKey(name: "host_icon")  String? hostIcon, @JsonKey(name: "chunks")  int? chunks, @JsonKey(name: "crc")  int? crc, @JsonKey(name: "download")  String? download, @JsonKey(name: "streamable")  int? streamable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnrestrictedLinkModel() when $default != null:
return $default(_that.id,_that.filename,_that.mimeType,_that.filesize,_that.link,_that.host,_that.hostIcon,_that.chunks,_that.crc,_that.download,_that.streamable);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "mimeType")  String? mimeType, @JsonKey(name: "filesize")  int? filesize, @JsonKey(name: "link")  String? link, @JsonKey(name: "host")  String? host, @JsonKey(name: "host_icon")  String? hostIcon, @JsonKey(name: "chunks")  int? chunks, @JsonKey(name: "crc")  int? crc, @JsonKey(name: "download")  String? download, @JsonKey(name: "streamable")  int? streamable)  $default,) {final _that = this;
switch (_that) {
case _UnrestrictedLinkModel():
return $default(_that.id,_that.filename,_that.mimeType,_that.filesize,_that.link,_that.host,_that.hostIcon,_that.chunks,_that.crc,_that.download,_that.streamable);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "mimeType")  String? mimeType, @JsonKey(name: "filesize")  int? filesize, @JsonKey(name: "link")  String? link, @JsonKey(name: "host")  String? host, @JsonKey(name: "host_icon")  String? hostIcon, @JsonKey(name: "chunks")  int? chunks, @JsonKey(name: "crc")  int? crc, @JsonKey(name: "download")  String? download, @JsonKey(name: "streamable")  int? streamable)?  $default,) {final _that = this;
switch (_that) {
case _UnrestrictedLinkModel() when $default != null:
return $default(_that.id,_that.filename,_that.mimeType,_that.filesize,_that.link,_that.host,_that.hostIcon,_that.chunks,_that.crc,_that.download,_that.streamable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnrestrictedLinkModel implements UnrestrictedLinkModel {
  const _UnrestrictedLinkModel({@JsonKey(name: "id") this.id, @JsonKey(name: "filename") this.filename, @JsonKey(name: "mimeType") this.mimeType, @JsonKey(name: "filesize") this.filesize, @JsonKey(name: "link") this.link, @JsonKey(name: "host") this.host, @JsonKey(name: "host_icon") this.hostIcon, @JsonKey(name: "chunks") this.chunks, @JsonKey(name: "crc") this.crc, @JsonKey(name: "download") this.download, @JsonKey(name: "streamable") this.streamable});
  factory _UnrestrictedLinkModel.fromJson(Map<String, dynamic> json) => _$UnrestrictedLinkModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "filename") final  String? filename;
@override@JsonKey(name: "mimeType") final  String? mimeType;
@override@JsonKey(name: "filesize") final  int? filesize;
@override@JsonKey(name: "link") final  String? link;
@override@JsonKey(name: "host") final  String? host;
@override@JsonKey(name: "host_icon") final  String? hostIcon;
@override@JsonKey(name: "chunks") final  int? chunks;
@override@JsonKey(name: "crc") final  int? crc;
@override@JsonKey(name: "download") final  String? download;
@override@JsonKey(name: "streamable") final  int? streamable;

/// Create a copy of UnrestrictedLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnrestrictedLinkModelCopyWith<_UnrestrictedLinkModel> get copyWith => __$UnrestrictedLinkModelCopyWithImpl<_UnrestrictedLinkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnrestrictedLinkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnrestrictedLinkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.link, link) || other.link == link)&&(identical(other.host, host) || other.host == host)&&(identical(other.hostIcon, hostIcon) || other.hostIcon == hostIcon)&&(identical(other.chunks, chunks) || other.chunks == chunks)&&(identical(other.crc, crc) || other.crc == crc)&&(identical(other.download, download) || other.download == download)&&(identical(other.streamable, streamable) || other.streamable == streamable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,mimeType,filesize,link,host,hostIcon,chunks,crc,download,streamable);

@override
String toString() {
  return 'UnrestrictedLinkModel(id: $id, filename: $filename, mimeType: $mimeType, filesize: $filesize, link: $link, host: $host, hostIcon: $hostIcon, chunks: $chunks, crc: $crc, download: $download, streamable: $streamable)';
}


}

/// @nodoc
abstract mixin class _$UnrestrictedLinkModelCopyWith<$Res> implements $UnrestrictedLinkModelCopyWith<$Res> {
  factory _$UnrestrictedLinkModelCopyWith(_UnrestrictedLinkModel value, $Res Function(_UnrestrictedLinkModel) _then) = __$UnrestrictedLinkModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "filename") String? filename,@JsonKey(name: "mimeType") String? mimeType,@JsonKey(name: "filesize") int? filesize,@JsonKey(name: "link") String? link,@JsonKey(name: "host") String? host,@JsonKey(name: "host_icon") String? hostIcon,@JsonKey(name: "chunks") int? chunks,@JsonKey(name: "crc") int? crc,@JsonKey(name: "download") String? download,@JsonKey(name: "streamable") int? streamable
});




}
/// @nodoc
class __$UnrestrictedLinkModelCopyWithImpl<$Res>
    implements _$UnrestrictedLinkModelCopyWith<$Res> {
  __$UnrestrictedLinkModelCopyWithImpl(this._self, this._then);

  final _UnrestrictedLinkModel _self;
  final $Res Function(_UnrestrictedLinkModel) _then;

/// Create a copy of UnrestrictedLinkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? filename = freezed,Object? mimeType = freezed,Object? filesize = freezed,Object? link = freezed,Object? host = freezed,Object? hostIcon = freezed,Object? chunks = freezed,Object? crc = freezed,Object? download = freezed,Object? streamable = freezed,}) {
  return _then(_UnrestrictedLinkModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,filesize: freezed == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,hostIcon: freezed == hostIcon ? _self.hostIcon : hostIcon // ignore: cast_nullable_to_non_nullable
as String?,chunks: freezed == chunks ? _self.chunks : chunks // ignore: cast_nullable_to_non_nullable
as int?,crc: freezed == crc ? _self.crc : crc // ignore: cast_nullable_to_non_nullable
as int?,download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as String?,streamable: freezed == streamable ? _self.streamable : streamable // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
