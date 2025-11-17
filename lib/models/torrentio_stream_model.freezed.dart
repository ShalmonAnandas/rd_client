// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrentio_stream_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TorrentioStreamResponse {

 List<TorrentioStream>? get streams;
/// Create a copy of TorrentioStreamResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentioStreamResponseCopyWith<TorrentioStreamResponse> get copyWith => _$TorrentioStreamResponseCopyWithImpl<TorrentioStreamResponse>(this as TorrentioStreamResponse, _$identity);

  /// Serializes this TorrentioStreamResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentioStreamResponse&&const DeepCollectionEquality().equals(other.streams, streams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(streams));

@override
String toString() {
  return 'TorrentioStreamResponse(streams: $streams)';
}


}

/// @nodoc
abstract mixin class $TorrentioStreamResponseCopyWith<$Res>  {
  factory $TorrentioStreamResponseCopyWith(TorrentioStreamResponse value, $Res Function(TorrentioStreamResponse) _then) = _$TorrentioStreamResponseCopyWithImpl;
@useResult
$Res call({
 List<TorrentioStream>? streams
});




}
/// @nodoc
class _$TorrentioStreamResponseCopyWithImpl<$Res>
    implements $TorrentioStreamResponseCopyWith<$Res> {
  _$TorrentioStreamResponseCopyWithImpl(this._self, this._then);

  final TorrentioStreamResponse _self;
  final $Res Function(TorrentioStreamResponse) _then;

/// Create a copy of TorrentioStreamResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streams = freezed,}) {
  return _then(_self.copyWith(
streams: freezed == streams ? _self.streams : streams // ignore: cast_nullable_to_non_nullable
as List<TorrentioStream>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TorrentioStreamResponse].
extension TorrentioStreamResponsePatterns on TorrentioStreamResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorrentioStreamResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorrentioStreamResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorrentioStreamResponse value)  $default,){
final _that = this;
switch (_that) {
case _TorrentioStreamResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorrentioStreamResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TorrentioStreamResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TorrentioStream>? streams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorrentioStreamResponse() when $default != null:
return $default(_that.streams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TorrentioStream>? streams)  $default,) {final _that = this;
switch (_that) {
case _TorrentioStreamResponse():
return $default(_that.streams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TorrentioStream>? streams)?  $default,) {final _that = this;
switch (_that) {
case _TorrentioStreamResponse() when $default != null:
return $default(_that.streams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TorrentioStreamResponse implements TorrentioStreamResponse {
  const _TorrentioStreamResponse({final  List<TorrentioStream>? streams}): _streams = streams;
  factory _TorrentioStreamResponse.fromJson(Map<String, dynamic> json) => _$TorrentioStreamResponseFromJson(json);

 final  List<TorrentioStream>? _streams;
@override List<TorrentioStream>? get streams {
  final value = _streams;
  if (value == null) return null;
  if (_streams is EqualUnmodifiableListView) return _streams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TorrentioStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentioStreamResponseCopyWith<_TorrentioStreamResponse> get copyWith => __$TorrentioStreamResponseCopyWithImpl<_TorrentioStreamResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentioStreamResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorrentioStreamResponse&&const DeepCollectionEquality().equals(other._streams, _streams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_streams));

@override
String toString() {
  return 'TorrentioStreamResponse(streams: $streams)';
}


}

/// @nodoc
abstract mixin class _$TorrentioStreamResponseCopyWith<$Res> implements $TorrentioStreamResponseCopyWith<$Res> {
  factory _$TorrentioStreamResponseCopyWith(_TorrentioStreamResponse value, $Res Function(_TorrentioStreamResponse) _then) = __$TorrentioStreamResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TorrentioStream>? streams
});




}
/// @nodoc
class __$TorrentioStreamResponseCopyWithImpl<$Res>
    implements _$TorrentioStreamResponseCopyWith<$Res> {
  __$TorrentioStreamResponseCopyWithImpl(this._self, this._then);

  final _TorrentioStreamResponse _self;
  final $Res Function(_TorrentioStreamResponse) _then;

/// Create a copy of TorrentioStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streams = freezed,}) {
  return _then(_TorrentioStreamResponse(
streams: freezed == streams ? _self._streams : streams // ignore: cast_nullable_to_non_nullable
as List<TorrentioStream>?,
  ));
}


}


/// @nodoc
mixin _$TorrentioStream {

 String? get name; String? get title; String? get url;@JsonKey(name: 'infoHash') String? get infoHash;@JsonKey(name: 'fileIdx') int? get fileIdx;@JsonKey(name: 'behaviorHints') BehaviorHints? get behaviorHints;
/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentioStreamCopyWith<TorrentioStream> get copyWith => _$TorrentioStreamCopyWithImpl<TorrentioStream>(this as TorrentioStream, _$identity);

  /// Serializes this TorrentioStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentioStream&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.infoHash, infoHash) || other.infoHash == infoHash)&&(identical(other.fileIdx, fileIdx) || other.fileIdx == fileIdx)&&(identical(other.behaviorHints, behaviorHints) || other.behaviorHints == behaviorHints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,title,url,infoHash,fileIdx,behaviorHints);

@override
String toString() {
  return 'TorrentioStream(name: $name, title: $title, url: $url, infoHash: $infoHash, fileIdx: $fileIdx, behaviorHints: $behaviorHints)';
}


}

/// @nodoc
abstract mixin class $TorrentioStreamCopyWith<$Res>  {
  factory $TorrentioStreamCopyWith(TorrentioStream value, $Res Function(TorrentioStream) _then) = _$TorrentioStreamCopyWithImpl;
@useResult
$Res call({
 String? name, String? title, String? url,@JsonKey(name: 'infoHash') String? infoHash,@JsonKey(name: 'fileIdx') int? fileIdx,@JsonKey(name: 'behaviorHints') BehaviorHints? behaviorHints
});


$BehaviorHintsCopyWith<$Res>? get behaviorHints;

}
/// @nodoc
class _$TorrentioStreamCopyWithImpl<$Res>
    implements $TorrentioStreamCopyWith<$Res> {
  _$TorrentioStreamCopyWithImpl(this._self, this._then);

  final TorrentioStream _self;
  final $Res Function(TorrentioStream) _then;

/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? title = freezed,Object? url = freezed,Object? infoHash = freezed,Object? fileIdx = freezed,Object? behaviorHints = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,infoHash: freezed == infoHash ? _self.infoHash : infoHash // ignore: cast_nullable_to_non_nullable
as String?,fileIdx: freezed == fileIdx ? _self.fileIdx : fileIdx // ignore: cast_nullable_to_non_nullable
as int?,behaviorHints: freezed == behaviorHints ? _self.behaviorHints : behaviorHints // ignore: cast_nullable_to_non_nullable
as BehaviorHints?,
  ));
}
/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BehaviorHintsCopyWith<$Res>? get behaviorHints {
    if (_self.behaviorHints == null) {
    return null;
  }

  return $BehaviorHintsCopyWith<$Res>(_self.behaviorHints!, (value) {
    return _then(_self.copyWith(behaviorHints: value));
  });
}
}


/// Adds pattern-matching-related methods to [TorrentioStream].
extension TorrentioStreamPatterns on TorrentioStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorrentioStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorrentioStream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorrentioStream value)  $default,){
final _that = this;
switch (_that) {
case _TorrentioStream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorrentioStream value)?  $default,){
final _that = this;
switch (_that) {
case _TorrentioStream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? title,  String? url, @JsonKey(name: 'infoHash')  String? infoHash, @JsonKey(name: 'fileIdx')  int? fileIdx, @JsonKey(name: 'behaviorHints')  BehaviorHints? behaviorHints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorrentioStream() when $default != null:
return $default(_that.name,_that.title,_that.url,_that.infoHash,_that.fileIdx,_that.behaviorHints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? title,  String? url, @JsonKey(name: 'infoHash')  String? infoHash, @JsonKey(name: 'fileIdx')  int? fileIdx, @JsonKey(name: 'behaviorHints')  BehaviorHints? behaviorHints)  $default,) {final _that = this;
switch (_that) {
case _TorrentioStream():
return $default(_that.name,_that.title,_that.url,_that.infoHash,_that.fileIdx,_that.behaviorHints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? title,  String? url, @JsonKey(name: 'infoHash')  String? infoHash, @JsonKey(name: 'fileIdx')  int? fileIdx, @JsonKey(name: 'behaviorHints')  BehaviorHints? behaviorHints)?  $default,) {final _that = this;
switch (_that) {
case _TorrentioStream() when $default != null:
return $default(_that.name,_that.title,_that.url,_that.infoHash,_that.fileIdx,_that.behaviorHints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TorrentioStream implements TorrentioStream {
  const _TorrentioStream({this.name, this.title, this.url, @JsonKey(name: 'infoHash') this.infoHash, @JsonKey(name: 'fileIdx') this.fileIdx, @JsonKey(name: 'behaviorHints') this.behaviorHints});
  factory _TorrentioStream.fromJson(Map<String, dynamic> json) => _$TorrentioStreamFromJson(json);

@override final  String? name;
@override final  String? title;
@override final  String? url;
@override@JsonKey(name: 'infoHash') final  String? infoHash;
@override@JsonKey(name: 'fileIdx') final  int? fileIdx;
@override@JsonKey(name: 'behaviorHints') final  BehaviorHints? behaviorHints;

/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentioStreamCopyWith<_TorrentioStream> get copyWith => __$TorrentioStreamCopyWithImpl<_TorrentioStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentioStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorrentioStream&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.infoHash, infoHash) || other.infoHash == infoHash)&&(identical(other.fileIdx, fileIdx) || other.fileIdx == fileIdx)&&(identical(other.behaviorHints, behaviorHints) || other.behaviorHints == behaviorHints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,title,url,infoHash,fileIdx,behaviorHints);

@override
String toString() {
  return 'TorrentioStream(name: $name, title: $title, url: $url, infoHash: $infoHash, fileIdx: $fileIdx, behaviorHints: $behaviorHints)';
}


}

/// @nodoc
abstract mixin class _$TorrentioStreamCopyWith<$Res> implements $TorrentioStreamCopyWith<$Res> {
  factory _$TorrentioStreamCopyWith(_TorrentioStream value, $Res Function(_TorrentioStream) _then) = __$TorrentioStreamCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? title, String? url,@JsonKey(name: 'infoHash') String? infoHash,@JsonKey(name: 'fileIdx') int? fileIdx,@JsonKey(name: 'behaviorHints') BehaviorHints? behaviorHints
});


@override $BehaviorHintsCopyWith<$Res>? get behaviorHints;

}
/// @nodoc
class __$TorrentioStreamCopyWithImpl<$Res>
    implements _$TorrentioStreamCopyWith<$Res> {
  __$TorrentioStreamCopyWithImpl(this._self, this._then);

  final _TorrentioStream _self;
  final $Res Function(_TorrentioStream) _then;

/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? title = freezed,Object? url = freezed,Object? infoHash = freezed,Object? fileIdx = freezed,Object? behaviorHints = freezed,}) {
  return _then(_TorrentioStream(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,infoHash: freezed == infoHash ? _self.infoHash : infoHash // ignore: cast_nullable_to_non_nullable
as String?,fileIdx: freezed == fileIdx ? _self.fileIdx : fileIdx // ignore: cast_nullable_to_non_nullable
as int?,behaviorHints: freezed == behaviorHints ? _self.behaviorHints : behaviorHints // ignore: cast_nullable_to_non_nullable
as BehaviorHints?,
  ));
}

/// Create a copy of TorrentioStream
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BehaviorHintsCopyWith<$Res>? get behaviorHints {
    if (_self.behaviorHints == null) {
    return null;
  }

  return $BehaviorHintsCopyWith<$Res>(_self.behaviorHints!, (value) {
    return _then(_self.copyWith(behaviorHints: value));
  });
}
}


/// @nodoc
mixin _$BehaviorHints {

@JsonKey(name: 'bingeGroup') String? get bingeGroup; String? get filename;
/// Create a copy of BehaviorHints
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BehaviorHintsCopyWith<BehaviorHints> get copyWith => _$BehaviorHintsCopyWithImpl<BehaviorHints>(this as BehaviorHints, _$identity);

  /// Serializes this BehaviorHints to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BehaviorHints&&(identical(other.bingeGroup, bingeGroup) || other.bingeGroup == bingeGroup)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bingeGroup,filename);

@override
String toString() {
  return 'BehaviorHints(bingeGroup: $bingeGroup, filename: $filename)';
}


}

/// @nodoc
abstract mixin class $BehaviorHintsCopyWith<$Res>  {
  factory $BehaviorHintsCopyWith(BehaviorHints value, $Res Function(BehaviorHints) _then) = _$BehaviorHintsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'bingeGroup') String? bingeGroup, String? filename
});




}
/// @nodoc
class _$BehaviorHintsCopyWithImpl<$Res>
    implements $BehaviorHintsCopyWith<$Res> {
  _$BehaviorHintsCopyWithImpl(this._self, this._then);

  final BehaviorHints _self;
  final $Res Function(BehaviorHints) _then;

/// Create a copy of BehaviorHints
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bingeGroup = freezed,Object? filename = freezed,}) {
  return _then(_self.copyWith(
bingeGroup: freezed == bingeGroup ? _self.bingeGroup : bingeGroup // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BehaviorHints].
extension BehaviorHintsPatterns on BehaviorHints {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BehaviorHints value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BehaviorHints() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BehaviorHints value)  $default,){
final _that = this;
switch (_that) {
case _BehaviorHints():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BehaviorHints value)?  $default,){
final _that = this;
switch (_that) {
case _BehaviorHints() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'bingeGroup')  String? bingeGroup,  String? filename)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BehaviorHints() when $default != null:
return $default(_that.bingeGroup,_that.filename);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'bingeGroup')  String? bingeGroup,  String? filename)  $default,) {final _that = this;
switch (_that) {
case _BehaviorHints():
return $default(_that.bingeGroup,_that.filename);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'bingeGroup')  String? bingeGroup,  String? filename)?  $default,) {final _that = this;
switch (_that) {
case _BehaviorHints() when $default != null:
return $default(_that.bingeGroup,_that.filename);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BehaviorHints implements BehaviorHints {
  const _BehaviorHints({@JsonKey(name: 'bingeGroup') this.bingeGroup, this.filename});
  factory _BehaviorHints.fromJson(Map<String, dynamic> json) => _$BehaviorHintsFromJson(json);

@override@JsonKey(name: 'bingeGroup') final  String? bingeGroup;
@override final  String? filename;

/// Create a copy of BehaviorHints
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BehaviorHintsCopyWith<_BehaviorHints> get copyWith => __$BehaviorHintsCopyWithImpl<_BehaviorHints>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BehaviorHintsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BehaviorHints&&(identical(other.bingeGroup, bingeGroup) || other.bingeGroup == bingeGroup)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bingeGroup,filename);

@override
String toString() {
  return 'BehaviorHints(bingeGroup: $bingeGroup, filename: $filename)';
}


}

/// @nodoc
abstract mixin class _$BehaviorHintsCopyWith<$Res> implements $BehaviorHintsCopyWith<$Res> {
  factory _$BehaviorHintsCopyWith(_BehaviorHints value, $Res Function(_BehaviorHints) _then) = __$BehaviorHintsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'bingeGroup') String? bingeGroup, String? filename
});




}
/// @nodoc
class __$BehaviorHintsCopyWithImpl<$Res>
    implements _$BehaviorHintsCopyWith<$Res> {
  __$BehaviorHintsCopyWithImpl(this._self, this._then);

  final _BehaviorHints _self;
  final $Res Function(_BehaviorHints) _then;

/// Create a copy of BehaviorHints
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bingeGroup = freezed,Object? filename = freezed,}) {
  return _then(_BehaviorHints(
bingeGroup: freezed == bingeGroup ? _self.bingeGroup : bingeGroup // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
