// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaModel {

@JsonKey(name: 'backdrop_path') String? get backdropPath; int? get id; String? get title; String? get name;@JsonKey(name: 'original_title') String? get originalTitle;@JsonKey(name: 'original_name') String? get originalName; String? get overview;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'media_type') String? get mediaType; bool? get adult;@JsonKey(name: 'original_language') String? get originalLanguage;@JsonKey(name: 'genre_ids') List<int>? get genreIds; double? get popularity;@JsonKey(name: 'release_date') String? get releaseDate; bool? get video;@JsonKey(name: 'vote_average') double? get voteAverage;@JsonKey(name: 'vote_count') int? get voteCount;
/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaModelCopyWith<MediaModel> get copyWith => _$MediaModelCopyWithImpl<MediaModel>(this as MediaModel, _$identity);

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaModel&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backdropPath,id,title,name,originalTitle,originalName,overview,posterPath,mediaType,adult,originalLanguage,const DeepCollectionEquality().hash(genreIds),popularity,releaseDate,video,voteAverage,voteCount);

@override
String toString() {
  return 'MediaModel(backdropPath: $backdropPath, id: $id, title: $title, name: $name, originalTitle: $originalTitle, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, adult: $adult, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $MediaModelCopyWith<$Res>  {
  factory $MediaModelCopyWith(MediaModel value, $Res Function(MediaModel) _then) = _$MediaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'backdrop_path') String? backdropPath, int? id, String? title, String? name,@JsonKey(name: 'original_title') String? originalTitle,@JsonKey(name: 'original_name') String? originalName, String? overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'media_type') String? mediaType, bool? adult,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'genre_ids') List<int>? genreIds, double? popularity,@JsonKey(name: 'release_date') String? releaseDate, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount
});




}
/// @nodoc
class _$MediaModelCopyWithImpl<$Res>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._self, this._then);

  final MediaModel _self;
  final $Res Function(MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backdropPath = freezed,Object? id = freezed,Object? title = freezed,Object? name = freezed,Object? originalTitle = freezed,Object? originalName = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = freezed,Object? adult = freezed,Object? originalLanguage = freezed,Object? genreIds = freezed,Object? popularity = freezed,Object? releaseDate = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,}) {
  return _then(_self.copyWith(
backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaModel].
extension MediaModelPatterns on MediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int? id,  String? title,  String? name, @JsonKey(name: 'original_title')  String? originalTitle, @JsonKey(name: 'original_name')  String? originalName,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool? adult, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  double? popularity, @JsonKey(name: 'release_date')  String? releaseDate,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.backdropPath,_that.id,_that.title,_that.name,_that.originalTitle,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int? id,  String? title,  String? name, @JsonKey(name: 'original_title')  String? originalTitle, @JsonKey(name: 'original_name')  String? originalName,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool? adult, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  double? popularity, @JsonKey(name: 'release_date')  String? releaseDate,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)  $default,) {final _that = this;
switch (_that) {
case _MediaModel():
return $default(_that.backdropPath,_that.id,_that.title,_that.name,_that.originalTitle,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int? id,  String? title,  String? name, @JsonKey(name: 'original_title')  String? originalTitle, @JsonKey(name: 'original_name')  String? originalName,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool? adult, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  double? popularity, @JsonKey(name: 'release_date')  String? releaseDate,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)?  $default,) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.backdropPath,_that.id,_that.title,_that.name,_that.originalTitle,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaModel implements MediaModel {
  const _MediaModel({@JsonKey(name: 'backdrop_path') this.backdropPath, this.id, this.title, this.name, @JsonKey(name: 'original_title') this.originalTitle, @JsonKey(name: 'original_name') this.originalName, this.overview, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'media_type') this.mediaType, this.adult, @JsonKey(name: 'original_language') this.originalLanguage, @JsonKey(name: 'genre_ids') final  List<int>? genreIds, this.popularity, @JsonKey(name: 'release_date') this.releaseDate, this.video, @JsonKey(name: 'vote_average') this.voteAverage, @JsonKey(name: 'vote_count') this.voteCount}): _genreIds = genreIds;
  factory _MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override final  int? id;
@override final  String? title;
@override final  String? name;
@override@JsonKey(name: 'original_title') final  String? originalTitle;
@override@JsonKey(name: 'original_name') final  String? originalName;
@override final  String? overview;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'media_type') final  String? mediaType;
@override final  bool? adult;
@override@JsonKey(name: 'original_language') final  String? originalLanguage;
 final  List<int>? _genreIds;
@override@JsonKey(name: 'genre_ids') List<int>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? popularity;
@override@JsonKey(name: 'release_date') final  String? releaseDate;
@override final  bool? video;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;
@override@JsonKey(name: 'vote_count') final  int? voteCount;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaModelCopyWith<_MediaModel> get copyWith => __$MediaModelCopyWithImpl<_MediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaModel&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backdropPath,id,title,name,originalTitle,originalName,overview,posterPath,mediaType,adult,originalLanguage,const DeepCollectionEquality().hash(_genreIds),popularity,releaseDate,video,voteAverage,voteCount);

@override
String toString() {
  return 'MediaModel(backdropPath: $backdropPath, id: $id, title: $title, name: $name, originalTitle: $originalTitle, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, adult: $adult, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$MediaModelCopyWith<$Res> implements $MediaModelCopyWith<$Res> {
  factory _$MediaModelCopyWith(_MediaModel value, $Res Function(_MediaModel) _then) = __$MediaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'backdrop_path') String? backdropPath, int? id, String? title, String? name,@JsonKey(name: 'original_title') String? originalTitle,@JsonKey(name: 'original_name') String? originalName, String? overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'media_type') String? mediaType, bool? adult,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'genre_ids') List<int>? genreIds, double? popularity,@JsonKey(name: 'release_date') String? releaseDate, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount
});




}
/// @nodoc
class __$MediaModelCopyWithImpl<$Res>
    implements _$MediaModelCopyWith<$Res> {
  __$MediaModelCopyWithImpl(this._self, this._then);

  final _MediaModel _self;
  final $Res Function(_MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backdropPath = freezed,Object? id = freezed,Object? title = freezed,Object? name = freezed,Object? originalTitle = freezed,Object? originalName = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = freezed,Object? adult = freezed,Object? originalLanguage = freezed,Object? genreIds = freezed,Object? popularity = freezed,Object? releaseDate = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,}) {
  return _then(_MediaModel(
backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
