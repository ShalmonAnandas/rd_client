// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Torrent {

@JsonKey(name: "added") String? get added;@JsonKey(name: "bytes") int? get bytes;@JsonKey(name: "ended") String? get ended;@JsonKey(name: "filename") String? get filename;@JsonKey(name: "files") List<FileElement>? get files;@JsonKey(name: "hash") String? get hash;@JsonKey(name: "host") String? get host;@JsonKey(name: "id") String? get id;@JsonKey(name: "links") List<String>? get links;@JsonKey(name: "original_bytes") int? get originalBytes;@JsonKey(name: "original_filename") String? get originalFilename;@JsonKey(name: "progress") int? get progress;@JsonKey(name: "split") int? get split;@JsonKey(name: "status") String? get status;@JsonKey(name: "speed") int? get speed;@JsonKey(name: "seeders") int? get seeders;
/// Create a copy of Torrent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentCopyWith<Torrent> get copyWith => _$TorrentCopyWithImpl<Torrent>(this as Torrent, _$identity);

  /// Serializes this Torrent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Torrent&&(identical(other.added, added) || other.added == added)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.ended, ended) || other.ended == ended)&&(identical(other.filename, filename) || other.filename == filename)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.host, host) || other.host == host)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.originalBytes, originalBytes) || other.originalBytes == originalBytes)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.split, split) || other.split == split)&&(identical(other.status, status) || other.status == status)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.seeders, seeders) || other.seeders == seeders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,added,bytes,ended,filename,const DeepCollectionEquality().hash(files),hash,host,id,const DeepCollectionEquality().hash(links),originalBytes,originalFilename,progress,split,status,speed,seeders);

@override
String toString() {
  return 'Torrent(added: $added, bytes: $bytes, ended: $ended, filename: $filename, files: $files, hash: $hash, host: $host, id: $id, links: $links, originalBytes: $originalBytes, originalFilename: $originalFilename, progress: $progress, split: $split, status: $status, speed: $speed, seeders: $seeders)';
}


}

/// @nodoc
abstract mixin class $TorrentCopyWith<$Res>  {
  factory $TorrentCopyWith(Torrent value, $Res Function(Torrent) _then) = _$TorrentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "added") String? added,@JsonKey(name: "bytes") int? bytes,@JsonKey(name: "ended") String? ended,@JsonKey(name: "filename") String? filename,@JsonKey(name: "files") List<FileElement>? files,@JsonKey(name: "hash") String? hash,@JsonKey(name: "host") String? host,@JsonKey(name: "id") String? id,@JsonKey(name: "links") List<String>? links,@JsonKey(name: "original_bytes") int? originalBytes,@JsonKey(name: "original_filename") String? originalFilename,@JsonKey(name: "progress") int? progress,@JsonKey(name: "split") int? split,@JsonKey(name: "status") String? status,@JsonKey(name: "speed") int? speed,@JsonKey(name: "seeders") int? seeders
});




}
/// @nodoc
class _$TorrentCopyWithImpl<$Res>
    implements $TorrentCopyWith<$Res> {
  _$TorrentCopyWithImpl(this._self, this._then);

  final Torrent _self;
  final $Res Function(Torrent) _then;

/// Create a copy of Torrent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = freezed,Object? bytes = freezed,Object? ended = freezed,Object? filename = freezed,Object? files = freezed,Object? hash = freezed,Object? host = freezed,Object? id = freezed,Object? links = freezed,Object? originalBytes = freezed,Object? originalFilename = freezed,Object? progress = freezed,Object? split = freezed,Object? status = freezed,Object? speed = freezed,Object? seeders = freezed,}) {
  return _then(_self.copyWith(
added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,ended: freezed == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileElement>?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<String>?,originalBytes: freezed == originalBytes ? _self.originalBytes : originalBytes // ignore: cast_nullable_to_non_nullable
as int?,originalFilename: freezed == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,split: freezed == split ? _self.split : split // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int?,seeders: freezed == seeders ? _self.seeders : seeders // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Torrent].
extension TorrentPatterns on Torrent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Torrent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Torrent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Torrent value)  $default,){
final _that = this;
switch (_that) {
case _Torrent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Torrent value)?  $default,){
final _that = this;
switch (_that) {
case _Torrent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "added")  String? added, @JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "ended")  String? ended, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "files")  List<FileElement>? files, @JsonKey(name: "hash")  String? hash, @JsonKey(name: "host")  String? host, @JsonKey(name: "id")  String? id, @JsonKey(name: "links")  List<String>? links, @JsonKey(name: "original_bytes")  int? originalBytes, @JsonKey(name: "original_filename")  String? originalFilename, @JsonKey(name: "progress")  int? progress, @JsonKey(name: "split")  int? split, @JsonKey(name: "status")  String? status, @JsonKey(name: "speed")  int? speed, @JsonKey(name: "seeders")  int? seeders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Torrent() when $default != null:
return $default(_that.added,_that.bytes,_that.ended,_that.filename,_that.files,_that.hash,_that.host,_that.id,_that.links,_that.originalBytes,_that.originalFilename,_that.progress,_that.split,_that.status,_that.speed,_that.seeders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "added")  String? added, @JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "ended")  String? ended, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "files")  List<FileElement>? files, @JsonKey(name: "hash")  String? hash, @JsonKey(name: "host")  String? host, @JsonKey(name: "id")  String? id, @JsonKey(name: "links")  List<String>? links, @JsonKey(name: "original_bytes")  int? originalBytes, @JsonKey(name: "original_filename")  String? originalFilename, @JsonKey(name: "progress")  int? progress, @JsonKey(name: "split")  int? split, @JsonKey(name: "status")  String? status, @JsonKey(name: "speed")  int? speed, @JsonKey(name: "seeders")  int? seeders)  $default,) {final _that = this;
switch (_that) {
case _Torrent():
return $default(_that.added,_that.bytes,_that.ended,_that.filename,_that.files,_that.hash,_that.host,_that.id,_that.links,_that.originalBytes,_that.originalFilename,_that.progress,_that.split,_that.status,_that.speed,_that.seeders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "added")  String? added, @JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "ended")  String? ended, @JsonKey(name: "filename")  String? filename, @JsonKey(name: "files")  List<FileElement>? files, @JsonKey(name: "hash")  String? hash, @JsonKey(name: "host")  String? host, @JsonKey(name: "id")  String? id, @JsonKey(name: "links")  List<String>? links, @JsonKey(name: "original_bytes")  int? originalBytes, @JsonKey(name: "original_filename")  String? originalFilename, @JsonKey(name: "progress")  int? progress, @JsonKey(name: "split")  int? split, @JsonKey(name: "status")  String? status, @JsonKey(name: "speed")  int? speed, @JsonKey(name: "seeders")  int? seeders)?  $default,) {final _that = this;
switch (_that) {
case _Torrent() when $default != null:
return $default(_that.added,_that.bytes,_that.ended,_that.filename,_that.files,_that.hash,_that.host,_that.id,_that.links,_that.originalBytes,_that.originalFilename,_that.progress,_that.split,_that.status,_that.speed,_that.seeders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Torrent implements Torrent {
  const _Torrent({@JsonKey(name: "added") this.added, @JsonKey(name: "bytes") this.bytes, @JsonKey(name: "ended") this.ended, @JsonKey(name: "filename") this.filename, @JsonKey(name: "files") final  List<FileElement>? files, @JsonKey(name: "hash") this.hash, @JsonKey(name: "host") this.host, @JsonKey(name: "id") this.id, @JsonKey(name: "links") final  List<String>? links, @JsonKey(name: "original_bytes") this.originalBytes, @JsonKey(name: "original_filename") this.originalFilename, @JsonKey(name: "progress") this.progress, @JsonKey(name: "split") this.split, @JsonKey(name: "status") this.status, @JsonKey(name: "speed") this.speed, @JsonKey(name: "seeders") this.seeders}): _files = files,_links = links;
  factory _Torrent.fromJson(Map<String, dynamic> json) => _$TorrentFromJson(json);

@override@JsonKey(name: "added") final  String? added;
@override@JsonKey(name: "bytes") final  int? bytes;
@override@JsonKey(name: "ended") final  String? ended;
@override@JsonKey(name: "filename") final  String? filename;
 final  List<FileElement>? _files;
@override@JsonKey(name: "files") List<FileElement>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "hash") final  String? hash;
@override@JsonKey(name: "host") final  String? host;
@override@JsonKey(name: "id") final  String? id;
 final  List<String>? _links;
@override@JsonKey(name: "links") List<String>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "original_bytes") final  int? originalBytes;
@override@JsonKey(name: "original_filename") final  String? originalFilename;
@override@JsonKey(name: "progress") final  int? progress;
@override@JsonKey(name: "split") final  int? split;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "speed") final  int? speed;
@override@JsonKey(name: "seeders") final  int? seeders;

/// Create a copy of Torrent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentCopyWith<_Torrent> get copyWith => __$TorrentCopyWithImpl<_Torrent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Torrent&&(identical(other.added, added) || other.added == added)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.ended, ended) || other.ended == ended)&&(identical(other.filename, filename) || other.filename == filename)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.host, host) || other.host == host)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.originalBytes, originalBytes) || other.originalBytes == originalBytes)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.split, split) || other.split == split)&&(identical(other.status, status) || other.status == status)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.seeders, seeders) || other.seeders == seeders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,added,bytes,ended,filename,const DeepCollectionEquality().hash(_files),hash,host,id,const DeepCollectionEquality().hash(_links),originalBytes,originalFilename,progress,split,status,speed,seeders);

@override
String toString() {
  return 'Torrent(added: $added, bytes: $bytes, ended: $ended, filename: $filename, files: $files, hash: $hash, host: $host, id: $id, links: $links, originalBytes: $originalBytes, originalFilename: $originalFilename, progress: $progress, split: $split, status: $status, speed: $speed, seeders: $seeders)';
}


}

/// @nodoc
abstract mixin class _$TorrentCopyWith<$Res> implements $TorrentCopyWith<$Res> {
  factory _$TorrentCopyWith(_Torrent value, $Res Function(_Torrent) _then) = __$TorrentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "added") String? added,@JsonKey(name: "bytes") int? bytes,@JsonKey(name: "ended") String? ended,@JsonKey(name: "filename") String? filename,@JsonKey(name: "files") List<FileElement>? files,@JsonKey(name: "hash") String? hash,@JsonKey(name: "host") String? host,@JsonKey(name: "id") String? id,@JsonKey(name: "links") List<String>? links,@JsonKey(name: "original_bytes") int? originalBytes,@JsonKey(name: "original_filename") String? originalFilename,@JsonKey(name: "progress") int? progress,@JsonKey(name: "split") int? split,@JsonKey(name: "status") String? status,@JsonKey(name: "speed") int? speed,@JsonKey(name: "seeders") int? seeders
});




}
/// @nodoc
class __$TorrentCopyWithImpl<$Res>
    implements _$TorrentCopyWith<$Res> {
  __$TorrentCopyWithImpl(this._self, this._then);

  final _Torrent _self;
  final $Res Function(_Torrent) _then;

/// Create a copy of Torrent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = freezed,Object? bytes = freezed,Object? ended = freezed,Object? filename = freezed,Object? files = freezed,Object? hash = freezed,Object? host = freezed,Object? id = freezed,Object? links = freezed,Object? originalBytes = freezed,Object? originalFilename = freezed,Object? progress = freezed,Object? split = freezed,Object? status = freezed,Object? speed = freezed,Object? seeders = freezed,}) {
  return _then(_Torrent(
added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,ended: freezed == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as String?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileElement>?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<String>?,originalBytes: freezed == originalBytes ? _self.originalBytes : originalBytes // ignore: cast_nullable_to_non_nullable
as int?,originalFilename: freezed == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,split: freezed == split ? _self.split : split // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int?,seeders: freezed == seeders ? _self.seeders : seeders // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$FileElement {

@JsonKey(name: "bytes") int? get bytes;@JsonKey(name: "id") int? get id;@JsonKey(name: "path") String? get path;@JsonKey(name: "selected") int? get selected;
/// Create a copy of FileElement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileElementCopyWith<FileElement> get copyWith => _$FileElementCopyWithImpl<FileElement>(this as FileElement, _$identity);

  /// Serializes this FileElement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileElement&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.selected, selected) || other.selected == selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bytes,id,path,selected);

@override
String toString() {
  return 'FileElement(bytes: $bytes, id: $id, path: $path, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $FileElementCopyWith<$Res>  {
  factory $FileElementCopyWith(FileElement value, $Res Function(FileElement) _then) = _$FileElementCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "bytes") int? bytes,@JsonKey(name: "id") int? id,@JsonKey(name: "path") String? path,@JsonKey(name: "selected") int? selected
});




}
/// @nodoc
class _$FileElementCopyWithImpl<$Res>
    implements $FileElementCopyWith<$Res> {
  _$FileElementCopyWithImpl(this._self, this._then);

  final FileElement _self;
  final $Res Function(FileElement) _then;

/// Create a copy of FileElement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bytes = freezed,Object? id = freezed,Object? path = freezed,Object? selected = freezed,}) {
  return _then(_self.copyWith(
bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileElement].
extension FileElementPatterns on FileElement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileElement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileElement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileElement value)  $default,){
final _that = this;
switch (_that) {
case _FileElement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileElement value)?  $default,){
final _that = this;
switch (_that) {
case _FileElement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "id")  int? id, @JsonKey(name: "path")  String? path, @JsonKey(name: "selected")  int? selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileElement() when $default != null:
return $default(_that.bytes,_that.id,_that.path,_that.selected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "id")  int? id, @JsonKey(name: "path")  String? path, @JsonKey(name: "selected")  int? selected)  $default,) {final _that = this;
switch (_that) {
case _FileElement():
return $default(_that.bytes,_that.id,_that.path,_that.selected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "bytes")  int? bytes, @JsonKey(name: "id")  int? id, @JsonKey(name: "path")  String? path, @JsonKey(name: "selected")  int? selected)?  $default,) {final _that = this;
switch (_that) {
case _FileElement() when $default != null:
return $default(_that.bytes,_that.id,_that.path,_that.selected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileElement implements FileElement {
  const _FileElement({@JsonKey(name: "bytes") this.bytes, @JsonKey(name: "id") this.id, @JsonKey(name: "path") this.path, @JsonKey(name: "selected") this.selected});
  factory _FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);

@override@JsonKey(name: "bytes") final  int? bytes;
@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "path") final  String? path;
@override@JsonKey(name: "selected") final  int? selected;

/// Create a copy of FileElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileElementCopyWith<_FileElement> get copyWith => __$FileElementCopyWithImpl<_FileElement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileElement&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.selected, selected) || other.selected == selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bytes,id,path,selected);

@override
String toString() {
  return 'FileElement(bytes: $bytes, id: $id, path: $path, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$FileElementCopyWith<$Res> implements $FileElementCopyWith<$Res> {
  factory _$FileElementCopyWith(_FileElement value, $Res Function(_FileElement) _then) = __$FileElementCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "bytes") int? bytes,@JsonKey(name: "id") int? id,@JsonKey(name: "path") String? path,@JsonKey(name: "selected") int? selected
});




}
/// @nodoc
class __$FileElementCopyWithImpl<$Res>
    implements _$FileElementCopyWith<$Res> {
  __$FileElementCopyWithImpl(this._self, this._then);

  final _FileElement _self;
  final $Res Function(_FileElement) _then;

/// Create a copy of FileElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bytes = freezed,Object? id = freezed,Object? path = freezed,Object? selected = freezed,}) {
  return _then(_FileElement(
bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
