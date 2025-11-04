// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonModel {

 List<Episode>? get episodes;
/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<SeasonModel> get copyWith => _$SeasonModelCopyWithImpl<SeasonModel>(this as SeasonModel, _$identity);

  /// Serializes this SeasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonModel&&const DeepCollectionEquality().equals(other.episodes, episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'SeasonModel(episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $SeasonModelCopyWith<$Res>  {
  factory $SeasonModelCopyWith(SeasonModel value, $Res Function(SeasonModel) _then) = _$SeasonModelCopyWithImpl;
@useResult
$Res call({
 List<Episode>? episodes
});




}
/// @nodoc
class _$SeasonModelCopyWithImpl<$Res>
    implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._self, this._then);

  final SeasonModel _self;
  final $Res Function(SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodes = freezed,}) {
  return _then(_self.copyWith(
episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonModel].
extension SeasonModelPatterns on SeasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonModel value)  $default,){
final _that = this;
switch (_that) {
case _SeasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Episode>? episodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.episodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Episode>? episodes)  $default,) {final _that = this;
switch (_that) {
case _SeasonModel():
return $default(_that.episodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Episode>? episodes)?  $default,) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.episodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonModel implements SeasonModel {
  const _SeasonModel({final  List<Episode>? episodes}): _episodes = episodes;
  factory _SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);

 final  List<Episode>? _episodes;
@override List<Episode>? get episodes {
  final value = _episodes;
  if (value == null) return null;
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonModelCopyWith<_SeasonModel> get copyWith => __$SeasonModelCopyWithImpl<_SeasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonModel&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'SeasonModel(episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$SeasonModelCopyWith<$Res> implements $SeasonModelCopyWith<$Res> {
  factory _$SeasonModelCopyWith(_SeasonModel value, $Res Function(_SeasonModel) _then) = __$SeasonModelCopyWithImpl;
@override @useResult
$Res call({
 List<Episode>? episodes
});




}
/// @nodoc
class __$SeasonModelCopyWithImpl<$Res>
    implements _$SeasonModelCopyWith<$Res> {
  __$SeasonModelCopyWithImpl(this._self, this._then);

  final _SeasonModel _self;
  final $Res Function(_SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodes = freezed,}) {
  return _then(_SeasonModel(
episodes: freezed == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>?,
  ));
}


}


/// @nodoc
mixin _$Episode {

@JsonKey(name: 'air_date') DateTime? get airDate;@JsonKey(name: 'episode_number') int? get episodeNumber;@JsonKey(name: 'episode_type') String? get episodeType; int? get id; String? get name; String? get overview;@JsonKey(name: 'production_code') String? get productionCode; int? get runtime;@JsonKey(name: 'season_number') int? get seasonNumber;@JsonKey(name: 'show_id') int? get showId;@JsonKey(name: 'still_path') String? get stillPath;@JsonKey(name: 'vote_average') double? get voteAverage;@JsonKey(name: 'vote_count') int? get voteCount; List<Crew>? get crew;@JsonKey(name: 'guest_stars') List<Crew>? get guestStars;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.productionCode, productionCode) || other.productionCode == productionCode)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.showId, showId) || other.showId == showId)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&const DeepCollectionEquality().equals(other.crew, crew)&&const DeepCollectionEquality().equals(other.guestStars, guestStars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeNumber,episodeType,id,name,overview,productionCode,runtime,seasonNumber,showId,stillPath,voteAverage,voteCount,const DeepCollectionEquality().hash(crew),const DeepCollectionEquality().hash(guestStars));

@override
String toString() {
  return 'Episode(airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, id: $id, name: $name, overview: $overview, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount, crew: $crew, guestStars: $guestStars)';
}


}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res>  {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) = _$EpisodeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_number') int? episodeNumber,@JsonKey(name: 'episode_type') String? episodeType, int? id, String? name, String? overview,@JsonKey(name: 'production_code') String? productionCode, int? runtime,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'show_id') int? showId,@JsonKey(name: 'still_path') String? stillPath,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount, List<Crew>? crew,@JsonKey(name: 'guest_stars') List<Crew>? guestStars
});




}
/// @nodoc
class _$EpisodeCopyWithImpl<$Res>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airDate = freezed,Object? episodeNumber = freezed,Object? episodeType = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? productionCode = freezed,Object? runtime = freezed,Object? seasonNumber = freezed,Object? showId = freezed,Object? stillPath = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? crew = freezed,Object? guestStars = freezed,}) {
  return _then(_self.copyWith(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,productionCode: freezed == productionCode ? _self.productionCode : productionCode // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,showId: freezed == showId ? _self.showId : showId // ignore: cast_nullable_to_non_nullable
as int?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,crew: freezed == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<Crew>?,guestStars: freezed == guestStars ? _self.guestStars : guestStars // ignore: cast_nullable_to_non_nullable
as List<Crew>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Episode].
extension EpisodePatterns on Episode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Episode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Episode value)  $default,){
final _that = this;
switch (_that) {
case _Episode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Episode value)?  $default,){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType,  int? id,  String? name,  String? overview, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount,  List<Crew>? crew, @JsonKey(name: 'guest_stars')  List<Crew>? guestStars)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.airDate,_that.episodeNumber,_that.episodeType,_that.id,_that.name,_that.overview,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath,_that.voteAverage,_that.voteCount,_that.crew,_that.guestStars);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType,  int? id,  String? name,  String? overview, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount,  List<Crew>? crew, @JsonKey(name: 'guest_stars')  List<Crew>? guestStars)  $default,) {final _that = this;
switch (_that) {
case _Episode():
return $default(_that.airDate,_that.episodeNumber,_that.episodeType,_that.id,_that.name,_that.overview,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath,_that.voteAverage,_that.voteCount,_that.crew,_that.guestStars);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType,  int? id,  String? name,  String? overview, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount,  List<Crew>? crew, @JsonKey(name: 'guest_stars')  List<Crew>? guestStars)?  $default,) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.airDate,_that.episodeNumber,_that.episodeType,_that.id,_that.name,_that.overview,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath,_that.voteAverage,_that.voteCount,_that.crew,_that.guestStars);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Episode implements Episode {
  const _Episode({@JsonKey(name: 'air_date') this.airDate, @JsonKey(name: 'episode_number') this.episodeNumber, @JsonKey(name: 'episode_type') this.episodeType, this.id, this.name, this.overview, @JsonKey(name: 'production_code') this.productionCode, this.runtime, @JsonKey(name: 'season_number') this.seasonNumber, @JsonKey(name: 'show_id') this.showId, @JsonKey(name: 'still_path') this.stillPath, @JsonKey(name: 'vote_average') this.voteAverage, @JsonKey(name: 'vote_count') this.voteCount, final  List<Crew>? crew, @JsonKey(name: 'guest_stars') final  List<Crew>? guestStars}): _crew = crew,_guestStars = guestStars;
  factory _Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

@override@JsonKey(name: 'air_date') final  DateTime? airDate;
@override@JsonKey(name: 'episode_number') final  int? episodeNumber;
@override@JsonKey(name: 'episode_type') final  String? episodeType;
@override final  int? id;
@override final  String? name;
@override final  String? overview;
@override@JsonKey(name: 'production_code') final  String? productionCode;
@override final  int? runtime;
@override@JsonKey(name: 'season_number') final  int? seasonNumber;
@override@JsonKey(name: 'show_id') final  int? showId;
@override@JsonKey(name: 'still_path') final  String? stillPath;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;
@override@JsonKey(name: 'vote_count') final  int? voteCount;
 final  List<Crew>? _crew;
@override List<Crew>? get crew {
  final value = _crew;
  if (value == null) return null;
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Crew>? _guestStars;
@override@JsonKey(name: 'guest_stars') List<Crew>? get guestStars {
  final value = _guestStars;
  if (value == null) return null;
  if (_guestStars is EqualUnmodifiableListView) return _guestStars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeCopyWith<_Episode> get copyWith => __$EpisodeCopyWithImpl<_Episode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.productionCode, productionCode) || other.productionCode == productionCode)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.showId, showId) || other.showId == showId)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&const DeepCollectionEquality().equals(other._crew, _crew)&&const DeepCollectionEquality().equals(other._guestStars, _guestStars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeNumber,episodeType,id,name,overview,productionCode,runtime,seasonNumber,showId,stillPath,voteAverage,voteCount,const DeepCollectionEquality().hash(_crew),const DeepCollectionEquality().hash(_guestStars));

@override
String toString() {
  return 'Episode(airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, id: $id, name: $name, overview: $overview, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount, crew: $crew, guestStars: $guestStars)';
}


}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) = __$EpisodeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_number') int? episodeNumber,@JsonKey(name: 'episode_type') String? episodeType, int? id, String? name, String? overview,@JsonKey(name: 'production_code') String? productionCode, int? runtime,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'show_id') int? showId,@JsonKey(name: 'still_path') String? stillPath,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount, List<Crew>? crew,@JsonKey(name: 'guest_stars') List<Crew>? guestStars
});




}
/// @nodoc
class __$EpisodeCopyWithImpl<$Res>
    implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airDate = freezed,Object? episodeNumber = freezed,Object? episodeType = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? productionCode = freezed,Object? runtime = freezed,Object? seasonNumber = freezed,Object? showId = freezed,Object? stillPath = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? crew = freezed,Object? guestStars = freezed,}) {
  return _then(_Episode(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,productionCode: freezed == productionCode ? _self.productionCode : productionCode // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,showId: freezed == showId ? _self.showId : showId // ignore: cast_nullable_to_non_nullable
as int?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,crew: freezed == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<Crew>?,guestStars: freezed == guestStars ? _self._guestStars : guestStars // ignore: cast_nullable_to_non_nullable
as List<Crew>?,
  ));
}


}


/// @nodoc
mixin _$Crew {

 String? get job; String? get department;@JsonKey(name: 'credit_id') String? get creditId; bool? get adult; int? get gender; int? get id;@JsonKey(name: 'known_for_department') String? get knownForDepartment; String? get name;@JsonKey(name: 'original_name') String? get originalName; double? get popularity;@JsonKey(name: 'profile_path') String? get profilePath; String? get character; int? get order;
/// Create a copy of Crew
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrewCopyWith<Crew> get copyWith => _$CrewCopyWithImpl<Crew>(this as Crew, _$identity);

  /// Serializes this Crew to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Crew&&(identical(other.job, job) || other.job == job)&&(identical(other.department, department) || other.department == department)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.character, character) || other.character == character)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,department,creditId,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,character,order);

@override
String toString() {
  return 'Crew(job: $job, department: $department, creditId: $creditId, adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, character: $character, order: $order)';
}


}

/// @nodoc
abstract mixin class $CrewCopyWith<$Res>  {
  factory $CrewCopyWith(Crew value, $Res Function(Crew) _then) = _$CrewCopyWithImpl;
@useResult
$Res call({
 String? job, String? department,@JsonKey(name: 'credit_id') String? creditId, bool? adult, int? gender, int? id,@JsonKey(name: 'known_for_department') String? knownForDepartment, String? name,@JsonKey(name: 'original_name') String? originalName, double? popularity,@JsonKey(name: 'profile_path') String? profilePath, String? character, int? order
});




}
/// @nodoc
class _$CrewCopyWithImpl<$Res>
    implements $CrewCopyWith<$Res> {
  _$CrewCopyWithImpl(this._self, this._then);

  final Crew _self;
  final $Res Function(Crew) _then;

/// Create a copy of Crew
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? job = freezed,Object? department = freezed,Object? creditId = freezed,Object? adult = freezed,Object? gender = freezed,Object? id = freezed,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = freezed,Object? profilePath = freezed,Object? character = freezed,Object? order = freezed,}) {
  return _then(_self.copyWith(
job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Crew].
extension CrewPatterns on Crew {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Crew value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Crew() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Crew value)  $default,){
final _that = this;
switch (_that) {
case _Crew():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Crew value)?  $default,){
final _that = this;
switch (_that) {
case _Crew() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? job,  String? department, @JsonKey(name: 'credit_id')  String? creditId,  bool? adult,  int? gender,  int? id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String? name, @JsonKey(name: 'original_name')  String? originalName,  double? popularity, @JsonKey(name: 'profile_path')  String? profilePath,  String? character,  int? order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Crew() when $default != null:
return $default(_that.job,_that.department,_that.creditId,_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.character,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? job,  String? department, @JsonKey(name: 'credit_id')  String? creditId,  bool? adult,  int? gender,  int? id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String? name, @JsonKey(name: 'original_name')  String? originalName,  double? popularity, @JsonKey(name: 'profile_path')  String? profilePath,  String? character,  int? order)  $default,) {final _that = this;
switch (_that) {
case _Crew():
return $default(_that.job,_that.department,_that.creditId,_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.character,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? job,  String? department, @JsonKey(name: 'credit_id')  String? creditId,  bool? adult,  int? gender,  int? id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String? name, @JsonKey(name: 'original_name')  String? originalName,  double? popularity, @JsonKey(name: 'profile_path')  String? profilePath,  String? character,  int? order)?  $default,) {final _that = this;
switch (_that) {
case _Crew() when $default != null:
return $default(_that.job,_that.department,_that.creditId,_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.character,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Crew implements Crew {
  const _Crew({this.job, this.department, @JsonKey(name: 'credit_id') this.creditId, this.adult, this.gender, this.id, @JsonKey(name: 'known_for_department') this.knownForDepartment, this.name, @JsonKey(name: 'original_name') this.originalName, this.popularity, @JsonKey(name: 'profile_path') this.profilePath, this.character, this.order});
  factory _Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

@override final  String? job;
@override final  String? department;
@override@JsonKey(name: 'credit_id') final  String? creditId;
@override final  bool? adult;
@override final  int? gender;
@override final  int? id;
@override@JsonKey(name: 'known_for_department') final  String? knownForDepartment;
@override final  String? name;
@override@JsonKey(name: 'original_name') final  String? originalName;
@override final  double? popularity;
@override@JsonKey(name: 'profile_path') final  String? profilePath;
@override final  String? character;
@override final  int? order;

/// Create a copy of Crew
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrewCopyWith<_Crew> get copyWith => __$CrewCopyWithImpl<_Crew>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CrewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Crew&&(identical(other.job, job) || other.job == job)&&(identical(other.department, department) || other.department == department)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.character, character) || other.character == character)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,department,creditId,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,character,order);

@override
String toString() {
  return 'Crew(job: $job, department: $department, creditId: $creditId, adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, character: $character, order: $order)';
}


}

/// @nodoc
abstract mixin class _$CrewCopyWith<$Res> implements $CrewCopyWith<$Res> {
  factory _$CrewCopyWith(_Crew value, $Res Function(_Crew) _then) = __$CrewCopyWithImpl;
@override @useResult
$Res call({
 String? job, String? department,@JsonKey(name: 'credit_id') String? creditId, bool? adult, int? gender, int? id,@JsonKey(name: 'known_for_department') String? knownForDepartment, String? name,@JsonKey(name: 'original_name') String? originalName, double? popularity,@JsonKey(name: 'profile_path') String? profilePath, String? character, int? order
});




}
/// @nodoc
class __$CrewCopyWithImpl<$Res>
    implements _$CrewCopyWith<$Res> {
  __$CrewCopyWithImpl(this._self, this._then);

  final _Crew _self;
  final $Res Function(_Crew) _then;

/// Create a copy of Crew
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? job = freezed,Object? department = freezed,Object? creditId = freezed,Object? adult = freezed,Object? gender = freezed,Object? id = freezed,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = freezed,Object? profilePath = freezed,Object? character = freezed,Object? order = freezed,}) {
  return _then(_Crew(
job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
