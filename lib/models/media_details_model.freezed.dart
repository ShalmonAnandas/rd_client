// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaDetailsModel {

 bool? get adult;@JsonKey(name: 'backdrop_path') String? get backdropPath;@JsonKey(name: 'belongs_to_collection') dynamic get belongsToCollection; int? get budget; List<Genre>? get genres; String? get homepage; int? get id;@JsonKey(name: 'imdb_id') String? get imdbId;@JsonKey(name: 'origin_country') List<String>? get originCountry;@JsonKey(name: 'original_language') String? get originalLanguage;@JsonKey(name: 'original_title') String? get originalTitle; String? get overview; double? get popularity;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'production_companies') List<Network>? get productionCompanies;@JsonKey(name: 'production_countries') List<ProductionCountry>? get productionCountries;@JsonKey(name: 'release_date') DateTime? get releaseDate; int? get revenue; int? get runtime;@JsonKey(name: 'spoken_languages') List<SpokenLanguage>? get spokenLanguages; String? get status; String? get tagline; String? get title; bool? get video;@JsonKey(name: 'vote_average') double? get voteAverage;@JsonKey(name: 'vote_count') int? get voteCount;@JsonKey(name: 'external_ids') ExternalIds? get externalIds;@JsonKey(name: 'created_by') List<CreatedBy>? get createdBy;@JsonKey(name: 'episode_run_time') List<dynamic>? get episodeRunTime;@JsonKey(name: 'first_air_date') DateTime? get firstAirDate;@JsonKey(name: 'in_production') bool? get inProduction; List<String>? get languages;@JsonKey(name: 'last_air_date') DateTime? get lastAirDate;@JsonKey(name: 'last_episode_to_air') TEpisodeToAir? get lastEpisodeToAir; String? get name;@JsonKey(name: 'next_episode_to_air') TEpisodeToAir? get nextEpisodeToAir; List<Network>? get networks;@JsonKey(name: 'number_of_episodes') int? get numberOfEpisodes;@JsonKey(name: 'number_of_seasons') int? get numberOfSeasons;@JsonKey(name: 'original_name') String? get originalName; List<Season>? get seasons; String? get type;
/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaDetailsModelCopyWith<MediaDetailsModel> get copyWith => _$MediaDetailsModelCopyWithImpl<MediaDetailsModel>(this as MediaDetailsModel, _$identity);

  /// Serializes this MediaDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaDetailsModel&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.belongsToCollection, belongsToCollection)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other.productionCompanies, productionCompanies)&&const DeepCollectionEquality().equals(other.productionCountries, productionCountries)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other.spokenLanguages, spokenLanguages)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.externalIds, externalIds) || other.externalIds == externalIds)&&const DeepCollectionEquality().equals(other.createdBy, createdBy)&&const DeepCollectionEquality().equals(other.episodeRunTime, episodeRunTime)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.inProduction, inProduction) || other.inProduction == inProduction)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.lastAirDate, lastAirDate) || other.lastAirDate == lastAirDate)&&(identical(other.lastEpisodeToAir, lastEpisodeToAir) || other.lastEpisodeToAir == lastEpisodeToAir)&&(identical(other.name, name) || other.name == name)&&(identical(other.nextEpisodeToAir, nextEpisodeToAir) || other.nextEpisodeToAir == nextEpisodeToAir)&&const DeepCollectionEquality().equals(other.networks, networks)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(belongsToCollection),budget,const DeepCollectionEquality().hash(genres),homepage,id,imdbId,const DeepCollectionEquality().hash(originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,const DeepCollectionEquality().hash(productionCompanies),const DeepCollectionEquality().hash(productionCountries),releaseDate,revenue,runtime,const DeepCollectionEquality().hash(spokenLanguages),status,tagline,title,video,voteAverage,voteCount,externalIds,const DeepCollectionEquality().hash(createdBy),const DeepCollectionEquality().hash(episodeRunTime),firstAirDate,inProduction,const DeepCollectionEquality().hash(languages),lastAirDate,lastEpisodeToAir,name,nextEpisodeToAir,const DeepCollectionEquality().hash(networks),numberOfEpisodes,numberOfSeasons,originalName,const DeepCollectionEquality().hash(seasons),type]);

@override
String toString() {
  return 'MediaDetailsModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, externalIds: $externalIds, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originalName: $originalName, seasons: $seasons, type: $type)';
}


}

/// @nodoc
abstract mixin class $MediaDetailsModelCopyWith<$Res>  {
  factory $MediaDetailsModelCopyWith(MediaDetailsModel value, $Res Function(MediaDetailsModel) _then) = _$MediaDetailsModelCopyWithImpl;
@useResult
$Res call({
 bool? adult,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection, int? budget, List<Genre>? genres, String? homepage, int? id,@JsonKey(name: 'imdb_id') String? imdbId,@JsonKey(name: 'origin_country') List<String>? originCountry,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'original_title') String? originalTitle, String? overview, double? popularity,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'production_companies') List<Network>? productionCompanies,@JsonKey(name: 'production_countries') List<ProductionCountry>? productionCountries,@JsonKey(name: 'release_date') DateTime? releaseDate, int? revenue, int? runtime,@JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages, String? status, String? tagline, String? title, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount,@JsonKey(name: 'external_ids') ExternalIds? externalIds,@JsonKey(name: 'created_by') List<CreatedBy>? createdBy,@JsonKey(name: 'episode_run_time') List<dynamic>? episodeRunTime,@JsonKey(name: 'first_air_date') DateTime? firstAirDate,@JsonKey(name: 'in_production') bool? inProduction, List<String>? languages,@JsonKey(name: 'last_air_date') DateTime? lastAirDate,@JsonKey(name: 'last_episode_to_air') TEpisodeToAir? lastEpisodeToAir, String? name,@JsonKey(name: 'next_episode_to_air') TEpisodeToAir? nextEpisodeToAir, List<Network>? networks,@JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,@JsonKey(name: 'number_of_seasons') int? numberOfSeasons,@JsonKey(name: 'original_name') String? originalName, List<Season>? seasons, String? type
});


$ExternalIdsCopyWith<$Res>? get externalIds;$TEpisodeToAirCopyWith<$Res>? get lastEpisodeToAir;$TEpisodeToAirCopyWith<$Res>? get nextEpisodeToAir;

}
/// @nodoc
class _$MediaDetailsModelCopyWithImpl<$Res>
    implements $MediaDetailsModelCopyWith<$Res> {
  _$MediaDetailsModelCopyWithImpl(this._self, this._then);

  final MediaDetailsModel _self;
  final $Res Function(MediaDetailsModel) _then;

/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? belongsToCollection = freezed,Object? budget = freezed,Object? genres = freezed,Object? homepage = freezed,Object? id = freezed,Object? imdbId = freezed,Object? originCountry = freezed,Object? originalLanguage = freezed,Object? originalTitle = freezed,Object? overview = freezed,Object? popularity = freezed,Object? posterPath = freezed,Object? productionCompanies = freezed,Object? productionCountries = freezed,Object? releaseDate = freezed,Object? revenue = freezed,Object? runtime = freezed,Object? spokenLanguages = freezed,Object? status = freezed,Object? tagline = freezed,Object? title = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? externalIds = freezed,Object? createdBy = freezed,Object? episodeRunTime = freezed,Object? firstAirDate = freezed,Object? inProduction = freezed,Object? languages = freezed,Object? lastAirDate = freezed,Object? lastEpisodeToAir = freezed,Object? name = freezed,Object? nextEpisodeToAir = freezed,Object? networks = freezed,Object? numberOfEpisodes = freezed,Object? numberOfSeasons = freezed,Object? originalName = freezed,Object? seasons = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,belongsToCollection: freezed == belongsToCollection ? _self.belongsToCollection : belongsToCollection // ignore: cast_nullable_to_non_nullable
as dynamic,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,productionCompanies: freezed == productionCompanies ? _self.productionCompanies : productionCompanies // ignore: cast_nullable_to_non_nullable
as List<Network>?,productionCountries: freezed == productionCountries ? _self.productionCountries : productionCountries // ignore: cast_nullable_to_non_nullable
as List<ProductionCountry>?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,spokenLanguages: freezed == spokenLanguages ? _self.spokenLanguages : spokenLanguages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,externalIds: freezed == externalIds ? _self.externalIds : externalIds // ignore: cast_nullable_to_non_nullable
as ExternalIds?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as List<CreatedBy>?,episodeRunTime: freezed == episodeRunTime ? _self.episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inProduction: freezed == inProduction ? _self.inProduction : inProduction // ignore: cast_nullable_to_non_nullable
as bool?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,lastAirDate: freezed == lastAirDate ? _self.lastAirDate : lastAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastEpisodeToAir: freezed == lastEpisodeToAir ? _self.lastEpisodeToAir : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
as TEpisodeToAir?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nextEpisodeToAir: freezed == nextEpisodeToAir ? _self.nextEpisodeToAir : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
as TEpisodeToAir?,networks: freezed == networks ? _self.networks : networks // ignore: cast_nullable_to_non_nullable
as List<Network>?,numberOfEpisodes: freezed == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numberOfSeasons: freezed == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExternalIdsCopyWith<$Res>? get externalIds {
    if (_self.externalIds == null) {
    return null;
  }

  return $ExternalIdsCopyWith<$Res>(_self.externalIds!, (value) {
    return _then(_self.copyWith(externalIds: value));
  });
}/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TEpisodeToAirCopyWith<$Res>? get lastEpisodeToAir {
    if (_self.lastEpisodeToAir == null) {
    return null;
  }

  return $TEpisodeToAirCopyWith<$Res>(_self.lastEpisodeToAir!, (value) {
    return _then(_self.copyWith(lastEpisodeToAir: value));
  });
}/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TEpisodeToAirCopyWith<$Res>? get nextEpisodeToAir {
    if (_self.nextEpisodeToAir == null) {
    return null;
  }

  return $TEpisodeToAirCopyWith<$Res>(_self.nextEpisodeToAir!, (value) {
    return _then(_self.copyWith(nextEpisodeToAir: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaDetailsModel].
extension MediaDetailsModelPatterns on MediaDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'belongs_to_collection')  dynamic belongsToCollection,  int? budget,  List<Genre>? genres,  String? homepage,  int? id, @JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'origin_country')  List<String>? originCountry, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'production_companies')  List<Network>? productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry>? productionCountries, @JsonKey(name: 'release_date')  DateTime? releaseDate,  int? revenue,  int? runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage>? spokenLanguages,  String? status,  String? tagline,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'external_ids')  ExternalIds? externalIds, @JsonKey(name: 'created_by')  List<CreatedBy>? createdBy, @JsonKey(name: 'episode_run_time')  List<dynamic>? episodeRunTime, @JsonKey(name: 'first_air_date')  DateTime? firstAirDate, @JsonKey(name: 'in_production')  bool? inProduction,  List<String>? languages, @JsonKey(name: 'last_air_date')  DateTime? lastAirDate, @JsonKey(name: 'last_episode_to_air')  TEpisodeToAir? lastEpisodeToAir,  String? name, @JsonKey(name: 'next_episode_to_air')  TEpisodeToAir? nextEpisodeToAir,  List<Network>? networks, @JsonKey(name: 'number_of_episodes')  int? numberOfEpisodes, @JsonKey(name: 'number_of_seasons')  int? numberOfSeasons, @JsonKey(name: 'original_name')  String? originalName,  List<Season>? seasons,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaDetailsModel() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount,_that.externalIds,_that.createdBy,_that.episodeRunTime,_that.firstAirDate,_that.inProduction,_that.languages,_that.lastAirDate,_that.lastEpisodeToAir,_that.name,_that.nextEpisodeToAir,_that.networks,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originalName,_that.seasons,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'belongs_to_collection')  dynamic belongsToCollection,  int? budget,  List<Genre>? genres,  String? homepage,  int? id, @JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'origin_country')  List<String>? originCountry, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'production_companies')  List<Network>? productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry>? productionCountries, @JsonKey(name: 'release_date')  DateTime? releaseDate,  int? revenue,  int? runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage>? spokenLanguages,  String? status,  String? tagline,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'external_ids')  ExternalIds? externalIds, @JsonKey(name: 'created_by')  List<CreatedBy>? createdBy, @JsonKey(name: 'episode_run_time')  List<dynamic>? episodeRunTime, @JsonKey(name: 'first_air_date')  DateTime? firstAirDate, @JsonKey(name: 'in_production')  bool? inProduction,  List<String>? languages, @JsonKey(name: 'last_air_date')  DateTime? lastAirDate, @JsonKey(name: 'last_episode_to_air')  TEpisodeToAir? lastEpisodeToAir,  String? name, @JsonKey(name: 'next_episode_to_air')  TEpisodeToAir? nextEpisodeToAir,  List<Network>? networks, @JsonKey(name: 'number_of_episodes')  int? numberOfEpisodes, @JsonKey(name: 'number_of_seasons')  int? numberOfSeasons, @JsonKey(name: 'original_name')  String? originalName,  List<Season>? seasons,  String? type)  $default,) {final _that = this;
switch (_that) {
case _MediaDetailsModel():
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount,_that.externalIds,_that.createdBy,_that.episodeRunTime,_that.firstAirDate,_that.inProduction,_that.languages,_that.lastAirDate,_that.lastEpisodeToAir,_that.name,_that.nextEpisodeToAir,_that.networks,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originalName,_that.seasons,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'belongs_to_collection')  dynamic belongsToCollection,  int? budget,  List<Genre>? genres,  String? homepage,  int? id, @JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'origin_country')  List<String>? originCountry, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'production_companies')  List<Network>? productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry>? productionCountries, @JsonKey(name: 'release_date')  DateTime? releaseDate,  int? revenue,  int? runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage>? spokenLanguages,  String? status,  String? tagline,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'external_ids')  ExternalIds? externalIds, @JsonKey(name: 'created_by')  List<CreatedBy>? createdBy, @JsonKey(name: 'episode_run_time')  List<dynamic>? episodeRunTime, @JsonKey(name: 'first_air_date')  DateTime? firstAirDate, @JsonKey(name: 'in_production')  bool? inProduction,  List<String>? languages, @JsonKey(name: 'last_air_date')  DateTime? lastAirDate, @JsonKey(name: 'last_episode_to_air')  TEpisodeToAir? lastEpisodeToAir,  String? name, @JsonKey(name: 'next_episode_to_air')  TEpisodeToAir? nextEpisodeToAir,  List<Network>? networks, @JsonKey(name: 'number_of_episodes')  int? numberOfEpisodes, @JsonKey(name: 'number_of_seasons')  int? numberOfSeasons, @JsonKey(name: 'original_name')  String? originalName,  List<Season>? seasons,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _MediaDetailsModel() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount,_that.externalIds,_that.createdBy,_that.episodeRunTime,_that.firstAirDate,_that.inProduction,_that.languages,_that.lastAirDate,_that.lastEpisodeToAir,_that.name,_that.nextEpisodeToAir,_that.networks,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originalName,_that.seasons,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaDetailsModel implements MediaDetailsModel {
  const _MediaDetailsModel({this.adult, @JsonKey(name: 'backdrop_path') this.backdropPath, @JsonKey(name: 'belongs_to_collection') this.belongsToCollection, this.budget, final  List<Genre>? genres, this.homepage, this.id, @JsonKey(name: 'imdb_id') this.imdbId, @JsonKey(name: 'origin_country') final  List<String>? originCountry, @JsonKey(name: 'original_language') this.originalLanguage, @JsonKey(name: 'original_title') this.originalTitle, this.overview, this.popularity, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'production_companies') final  List<Network>? productionCompanies, @JsonKey(name: 'production_countries') final  List<ProductionCountry>? productionCountries, @JsonKey(name: 'release_date') this.releaseDate, this.revenue, this.runtime, @JsonKey(name: 'spoken_languages') final  List<SpokenLanguage>? spokenLanguages, this.status, this.tagline, this.title, this.video, @JsonKey(name: 'vote_average') this.voteAverage, @JsonKey(name: 'vote_count') this.voteCount, @JsonKey(name: 'external_ids') this.externalIds, @JsonKey(name: 'created_by') final  List<CreatedBy>? createdBy, @JsonKey(name: 'episode_run_time') final  List<dynamic>? episodeRunTime, @JsonKey(name: 'first_air_date') this.firstAirDate, @JsonKey(name: 'in_production') this.inProduction, final  List<String>? languages, @JsonKey(name: 'last_air_date') this.lastAirDate, @JsonKey(name: 'last_episode_to_air') this.lastEpisodeToAir, this.name, @JsonKey(name: 'next_episode_to_air') this.nextEpisodeToAir, final  List<Network>? networks, @JsonKey(name: 'number_of_episodes') this.numberOfEpisodes, @JsonKey(name: 'number_of_seasons') this.numberOfSeasons, @JsonKey(name: 'original_name') this.originalName, final  List<Season>? seasons, this.type}): _genres = genres,_originCountry = originCountry,_productionCompanies = productionCompanies,_productionCountries = productionCountries,_spokenLanguages = spokenLanguages,_createdBy = createdBy,_episodeRunTime = episodeRunTime,_languages = languages,_networks = networks,_seasons = seasons;
  factory _MediaDetailsModel.fromJson(Map<String, dynamic> json) => _$MediaDetailsModelFromJson(json);

@override final  bool? adult;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override@JsonKey(name: 'belongs_to_collection') final  dynamic belongsToCollection;
@override final  int? budget;
 final  List<Genre>? _genres;
@override List<Genre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? homepage;
@override final  int? id;
@override@JsonKey(name: 'imdb_id') final  String? imdbId;
 final  List<String>? _originCountry;
@override@JsonKey(name: 'origin_country') List<String>? get originCountry {
  final value = _originCountry;
  if (value == null) return null;
  if (_originCountry is EqualUnmodifiableListView) return _originCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'original_language') final  String? originalLanguage;
@override@JsonKey(name: 'original_title') final  String? originalTitle;
@override final  String? overview;
@override final  double? popularity;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
 final  List<Network>? _productionCompanies;
@override@JsonKey(name: 'production_companies') List<Network>? get productionCompanies {
  final value = _productionCompanies;
  if (value == null) return null;
  if (_productionCompanies is EqualUnmodifiableListView) return _productionCompanies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductionCountry>? _productionCountries;
@override@JsonKey(name: 'production_countries') List<ProductionCountry>? get productionCountries {
  final value = _productionCountries;
  if (value == null) return null;
  if (_productionCountries is EqualUnmodifiableListView) return _productionCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'release_date') final  DateTime? releaseDate;
@override final  int? revenue;
@override final  int? runtime;
 final  List<SpokenLanguage>? _spokenLanguages;
@override@JsonKey(name: 'spoken_languages') List<SpokenLanguage>? get spokenLanguages {
  final value = _spokenLanguages;
  if (value == null) return null;
  if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? status;
@override final  String? tagline;
@override final  String? title;
@override final  bool? video;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;
@override@JsonKey(name: 'vote_count') final  int? voteCount;
@override@JsonKey(name: 'external_ids') final  ExternalIds? externalIds;
 final  List<CreatedBy>? _createdBy;
@override@JsonKey(name: 'created_by') List<CreatedBy>? get createdBy {
  final value = _createdBy;
  if (value == null) return null;
  if (_createdBy is EqualUnmodifiableListView) return _createdBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _episodeRunTime;
@override@JsonKey(name: 'episode_run_time') List<dynamic>? get episodeRunTime {
  final value = _episodeRunTime;
  if (value == null) return null;
  if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'first_air_date') final  DateTime? firstAirDate;
@override@JsonKey(name: 'in_production') final  bool? inProduction;
 final  List<String>? _languages;
@override List<String>? get languages {
  final value = _languages;
  if (value == null) return null;
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'last_air_date') final  DateTime? lastAirDate;
@override@JsonKey(name: 'last_episode_to_air') final  TEpisodeToAir? lastEpisodeToAir;
@override final  String? name;
@override@JsonKey(name: 'next_episode_to_air') final  TEpisodeToAir? nextEpisodeToAir;
 final  List<Network>? _networks;
@override List<Network>? get networks {
  final value = _networks;
  if (value == null) return null;
  if (_networks is EqualUnmodifiableListView) return _networks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'number_of_episodes') final  int? numberOfEpisodes;
@override@JsonKey(name: 'number_of_seasons') final  int? numberOfSeasons;
@override@JsonKey(name: 'original_name') final  String? originalName;
 final  List<Season>? _seasons;
@override List<Season>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? type;

/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaDetailsModelCopyWith<_MediaDetailsModel> get copyWith => __$MediaDetailsModelCopyWithImpl<_MediaDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaDetailsModel&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.belongsToCollection, belongsToCollection)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other._productionCompanies, _productionCompanies)&&const DeepCollectionEquality().equals(other._productionCountries, _productionCountries)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other._spokenLanguages, _spokenLanguages)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.externalIds, externalIds) || other.externalIds == externalIds)&&const DeepCollectionEquality().equals(other._createdBy, _createdBy)&&const DeepCollectionEquality().equals(other._episodeRunTime, _episodeRunTime)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.inProduction, inProduction) || other.inProduction == inProduction)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.lastAirDate, lastAirDate) || other.lastAirDate == lastAirDate)&&(identical(other.lastEpisodeToAir, lastEpisodeToAir) || other.lastEpisodeToAir == lastEpisodeToAir)&&(identical(other.name, name) || other.name == name)&&(identical(other.nextEpisodeToAir, nextEpisodeToAir) || other.nextEpisodeToAir == nextEpisodeToAir)&&const DeepCollectionEquality().equals(other._networks, _networks)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(belongsToCollection),budget,const DeepCollectionEquality().hash(_genres),homepage,id,imdbId,const DeepCollectionEquality().hash(_originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,const DeepCollectionEquality().hash(_productionCompanies),const DeepCollectionEquality().hash(_productionCountries),releaseDate,revenue,runtime,const DeepCollectionEquality().hash(_spokenLanguages),status,tagline,title,video,voteAverage,voteCount,externalIds,const DeepCollectionEquality().hash(_createdBy),const DeepCollectionEquality().hash(_episodeRunTime),firstAirDate,inProduction,const DeepCollectionEquality().hash(_languages),lastAirDate,lastEpisodeToAir,name,nextEpisodeToAir,const DeepCollectionEquality().hash(_networks),numberOfEpisodes,numberOfSeasons,originalName,const DeepCollectionEquality().hash(_seasons),type]);

@override
String toString() {
  return 'MediaDetailsModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, externalIds: $externalIds, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originalName: $originalName, seasons: $seasons, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MediaDetailsModelCopyWith<$Res> implements $MediaDetailsModelCopyWith<$Res> {
  factory _$MediaDetailsModelCopyWith(_MediaDetailsModel value, $Res Function(_MediaDetailsModel) _then) = __$MediaDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 bool? adult,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection, int? budget, List<Genre>? genres, String? homepage, int? id,@JsonKey(name: 'imdb_id') String? imdbId,@JsonKey(name: 'origin_country') List<String>? originCountry,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'original_title') String? originalTitle, String? overview, double? popularity,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'production_companies') List<Network>? productionCompanies,@JsonKey(name: 'production_countries') List<ProductionCountry>? productionCountries,@JsonKey(name: 'release_date') DateTime? releaseDate, int? revenue, int? runtime,@JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages, String? status, String? tagline, String? title, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount,@JsonKey(name: 'external_ids') ExternalIds? externalIds,@JsonKey(name: 'created_by') List<CreatedBy>? createdBy,@JsonKey(name: 'episode_run_time') List<dynamic>? episodeRunTime,@JsonKey(name: 'first_air_date') DateTime? firstAirDate,@JsonKey(name: 'in_production') bool? inProduction, List<String>? languages,@JsonKey(name: 'last_air_date') DateTime? lastAirDate,@JsonKey(name: 'last_episode_to_air') TEpisodeToAir? lastEpisodeToAir, String? name,@JsonKey(name: 'next_episode_to_air') TEpisodeToAir? nextEpisodeToAir, List<Network>? networks,@JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,@JsonKey(name: 'number_of_seasons') int? numberOfSeasons,@JsonKey(name: 'original_name') String? originalName, List<Season>? seasons, String? type
});


@override $ExternalIdsCopyWith<$Res>? get externalIds;@override $TEpisodeToAirCopyWith<$Res>? get lastEpisodeToAir;@override $TEpisodeToAirCopyWith<$Res>? get nextEpisodeToAir;

}
/// @nodoc
class __$MediaDetailsModelCopyWithImpl<$Res>
    implements _$MediaDetailsModelCopyWith<$Res> {
  __$MediaDetailsModelCopyWithImpl(this._self, this._then);

  final _MediaDetailsModel _self;
  final $Res Function(_MediaDetailsModel) _then;

/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? belongsToCollection = freezed,Object? budget = freezed,Object? genres = freezed,Object? homepage = freezed,Object? id = freezed,Object? imdbId = freezed,Object? originCountry = freezed,Object? originalLanguage = freezed,Object? originalTitle = freezed,Object? overview = freezed,Object? popularity = freezed,Object? posterPath = freezed,Object? productionCompanies = freezed,Object? productionCountries = freezed,Object? releaseDate = freezed,Object? revenue = freezed,Object? runtime = freezed,Object? spokenLanguages = freezed,Object? status = freezed,Object? tagline = freezed,Object? title = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? externalIds = freezed,Object? createdBy = freezed,Object? episodeRunTime = freezed,Object? firstAirDate = freezed,Object? inProduction = freezed,Object? languages = freezed,Object? lastAirDate = freezed,Object? lastEpisodeToAir = freezed,Object? name = freezed,Object? nextEpisodeToAir = freezed,Object? networks = freezed,Object? numberOfEpisodes = freezed,Object? numberOfSeasons = freezed,Object? originalName = freezed,Object? seasons = freezed,Object? type = freezed,}) {
  return _then(_MediaDetailsModel(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,belongsToCollection: freezed == belongsToCollection ? _self.belongsToCollection : belongsToCollection // ignore: cast_nullable_to_non_nullable
as dynamic,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,productionCompanies: freezed == productionCompanies ? _self._productionCompanies : productionCompanies // ignore: cast_nullable_to_non_nullable
as List<Network>?,productionCountries: freezed == productionCountries ? _self._productionCountries : productionCountries // ignore: cast_nullable_to_non_nullable
as List<ProductionCountry>?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,spokenLanguages: freezed == spokenLanguages ? _self._spokenLanguages : spokenLanguages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,externalIds: freezed == externalIds ? _self.externalIds : externalIds // ignore: cast_nullable_to_non_nullable
as ExternalIds?,createdBy: freezed == createdBy ? _self._createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as List<CreatedBy>?,episodeRunTime: freezed == episodeRunTime ? _self._episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inProduction: freezed == inProduction ? _self.inProduction : inProduction // ignore: cast_nullable_to_non_nullable
as bool?,languages: freezed == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,lastAirDate: freezed == lastAirDate ? _self.lastAirDate : lastAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastEpisodeToAir: freezed == lastEpisodeToAir ? _self.lastEpisodeToAir : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
as TEpisodeToAir?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nextEpisodeToAir: freezed == nextEpisodeToAir ? _self.nextEpisodeToAir : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
as TEpisodeToAir?,networks: freezed == networks ? _self._networks : networks // ignore: cast_nullable_to_non_nullable
as List<Network>?,numberOfEpisodes: freezed == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numberOfSeasons: freezed == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExternalIdsCopyWith<$Res>? get externalIds {
    if (_self.externalIds == null) {
    return null;
  }

  return $ExternalIdsCopyWith<$Res>(_self.externalIds!, (value) {
    return _then(_self.copyWith(externalIds: value));
  });
}/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TEpisodeToAirCopyWith<$Res>? get lastEpisodeToAir {
    if (_self.lastEpisodeToAir == null) {
    return null;
  }

  return $TEpisodeToAirCopyWith<$Res>(_self.lastEpisodeToAir!, (value) {
    return _then(_self.copyWith(lastEpisodeToAir: value));
  });
}/// Create a copy of MediaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TEpisodeToAirCopyWith<$Res>? get nextEpisodeToAir {
    if (_self.nextEpisodeToAir == null) {
    return null;
  }

  return $TEpisodeToAirCopyWith<$Res>(_self.nextEpisodeToAir!, (value) {
    return _then(_self.copyWith(nextEpisodeToAir: value));
  });
}
}


/// @nodoc
mixin _$CreatedBy {

 int? get id;@JsonKey(name: 'credit_id') String? get creditId; String? get name;@JsonKey(name: 'original_name') String? get originalName; int? get gender;@JsonKey(name: 'profile_path') dynamic get profilePath;
/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedByCopyWith<CreatedBy> get copyWith => _$CreatedByCopyWithImpl<CreatedBy>(this as CreatedBy, _$identity);

  /// Serializes this CreatedBy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedBy&&(identical(other.id, id) || other.id == id)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.profilePath, profilePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creditId,name,originalName,gender,const DeepCollectionEquality().hash(profilePath));

@override
String toString() {
  return 'CreatedBy(id: $id, creditId: $creditId, name: $name, originalName: $originalName, gender: $gender, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class $CreatedByCopyWith<$Res>  {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) _then) = _$CreatedByCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'credit_id') String? creditId, String? name,@JsonKey(name: 'original_name') String? originalName, int? gender,@JsonKey(name: 'profile_path') dynamic profilePath
});




}
/// @nodoc
class _$CreatedByCopyWithImpl<$Res>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._self, this._then);

  final CreatedBy _self;
  final $Res Function(CreatedBy) _then;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creditId = freezed,Object? name = freezed,Object? originalName = freezed,Object? gender = freezed,Object? profilePath = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedBy].
extension CreatedByPatterns on CreatedBy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedBy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedBy value)  $default,){
final _that = this;
switch (_that) {
case _CreatedBy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedBy value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'credit_id')  String? creditId,  String? name, @JsonKey(name: 'original_name')  String? originalName,  int? gender, @JsonKey(name: 'profile_path')  dynamic profilePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
return $default(_that.id,_that.creditId,_that.name,_that.originalName,_that.gender,_that.profilePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'credit_id')  String? creditId,  String? name, @JsonKey(name: 'original_name')  String? originalName,  int? gender, @JsonKey(name: 'profile_path')  dynamic profilePath)  $default,) {final _that = this;
switch (_that) {
case _CreatedBy():
return $default(_that.id,_that.creditId,_that.name,_that.originalName,_that.gender,_that.profilePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'credit_id')  String? creditId,  String? name, @JsonKey(name: 'original_name')  String? originalName,  int? gender, @JsonKey(name: 'profile_path')  dynamic profilePath)?  $default,) {final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
return $default(_that.id,_that.creditId,_that.name,_that.originalName,_that.gender,_that.profilePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedBy implements CreatedBy {
  const _CreatedBy({this.id, @JsonKey(name: 'credit_id') this.creditId, this.name, @JsonKey(name: 'original_name') this.originalName, this.gender, @JsonKey(name: 'profile_path') this.profilePath});
  factory _CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'credit_id') final  String? creditId;
@override final  String? name;
@override@JsonKey(name: 'original_name') final  String? originalName;
@override final  int? gender;
@override@JsonKey(name: 'profile_path') final  dynamic profilePath;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedByCopyWith<_CreatedBy> get copyWith => __$CreatedByCopyWithImpl<_CreatedBy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedByToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedBy&&(identical(other.id, id) || other.id == id)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.profilePath, profilePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creditId,name,originalName,gender,const DeepCollectionEquality().hash(profilePath));

@override
String toString() {
  return 'CreatedBy(id: $id, creditId: $creditId, name: $name, originalName: $originalName, gender: $gender, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class _$CreatedByCopyWith<$Res> implements $CreatedByCopyWith<$Res> {
  factory _$CreatedByCopyWith(_CreatedBy value, $Res Function(_CreatedBy) _then) = __$CreatedByCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'credit_id') String? creditId, String? name,@JsonKey(name: 'original_name') String? originalName, int? gender,@JsonKey(name: 'profile_path') dynamic profilePath
});




}
/// @nodoc
class __$CreatedByCopyWithImpl<$Res>
    implements _$CreatedByCopyWith<$Res> {
  __$CreatedByCopyWithImpl(this._self, this._then);

  final _CreatedBy _self;
  final $Res Function(_CreatedBy) _then;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creditId = freezed,Object? name = freezed,Object? originalName = freezed,Object? gender = freezed,Object? profilePath = freezed,}) {
  return _then(_CreatedBy(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$ExternalIds {

@JsonKey(name: 'imdb_id') String? get imdbId;@JsonKey(name: 'wikidata_id') String? get wikidataId;@JsonKey(name: 'facebook_id') dynamic get facebookId;@JsonKey(name: 'instagram_id') String? get instagramId;@JsonKey(name: 'twitter_id') String? get twitterId;@JsonKey(name: 'freebase_mid') dynamic get freebaseMid;@JsonKey(name: 'freebase_id') dynamic get freebaseId;@JsonKey(name: 'tvdb_id') int? get tvdbId;@JsonKey(name: 'tvrage_id') dynamic get tvrageId;
/// Create a copy of ExternalIds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExternalIdsCopyWith<ExternalIds> get copyWith => _$ExternalIdsCopyWithImpl<ExternalIds>(this as ExternalIds, _$identity);

  /// Serializes this ExternalIds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalIds&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.wikidataId, wikidataId) || other.wikidataId == wikidataId)&&const DeepCollectionEquality().equals(other.facebookId, facebookId)&&(identical(other.instagramId, instagramId) || other.instagramId == instagramId)&&(identical(other.twitterId, twitterId) || other.twitterId == twitterId)&&const DeepCollectionEquality().equals(other.freebaseMid, freebaseMid)&&const DeepCollectionEquality().equals(other.freebaseId, freebaseId)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&const DeepCollectionEquality().equals(other.tvrageId, tvrageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imdbId,wikidataId,const DeepCollectionEquality().hash(facebookId),instagramId,twitterId,const DeepCollectionEquality().hash(freebaseMid),const DeepCollectionEquality().hash(freebaseId),tvdbId,const DeepCollectionEquality().hash(tvrageId));

@override
String toString() {
  return 'ExternalIds(imdbId: $imdbId, wikidataId: $wikidataId, facebookId: $facebookId, instagramId: $instagramId, twitterId: $twitterId, freebaseMid: $freebaseMid, freebaseId: $freebaseId, tvdbId: $tvdbId, tvrageId: $tvrageId)';
}


}

/// @nodoc
abstract mixin class $ExternalIdsCopyWith<$Res>  {
  factory $ExternalIdsCopyWith(ExternalIds value, $Res Function(ExternalIds) _then) = _$ExternalIdsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'imdb_id') String? imdbId,@JsonKey(name: 'wikidata_id') String? wikidataId,@JsonKey(name: 'facebook_id') dynamic facebookId,@JsonKey(name: 'instagram_id') String? instagramId,@JsonKey(name: 'twitter_id') String? twitterId,@JsonKey(name: 'freebase_mid') dynamic freebaseMid,@JsonKey(name: 'freebase_id') dynamic freebaseId,@JsonKey(name: 'tvdb_id') int? tvdbId,@JsonKey(name: 'tvrage_id') dynamic tvrageId
});




}
/// @nodoc
class _$ExternalIdsCopyWithImpl<$Res>
    implements $ExternalIdsCopyWith<$Res> {
  _$ExternalIdsCopyWithImpl(this._self, this._then);

  final ExternalIds _self;
  final $Res Function(ExternalIds) _then;

/// Create a copy of ExternalIds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imdbId = freezed,Object? wikidataId = freezed,Object? facebookId = freezed,Object? instagramId = freezed,Object? twitterId = freezed,Object? freebaseMid = freezed,Object? freebaseId = freezed,Object? tvdbId = freezed,Object? tvrageId = freezed,}) {
  return _then(_self.copyWith(
imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,wikidataId: freezed == wikidataId ? _self.wikidataId : wikidataId // ignore: cast_nullable_to_non_nullable
as String?,facebookId: freezed == facebookId ? _self.facebookId : facebookId // ignore: cast_nullable_to_non_nullable
as dynamic,instagramId: freezed == instagramId ? _self.instagramId : instagramId // ignore: cast_nullable_to_non_nullable
as String?,twitterId: freezed == twitterId ? _self.twitterId : twitterId // ignore: cast_nullable_to_non_nullable
as String?,freebaseMid: freezed == freebaseMid ? _self.freebaseMid : freebaseMid // ignore: cast_nullable_to_non_nullable
as dynamic,freebaseId: freezed == freebaseId ? _self.freebaseId : freebaseId // ignore: cast_nullable_to_non_nullable
as dynamic,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,tvrageId: freezed == tvrageId ? _self.tvrageId : tvrageId // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ExternalIds].
extension ExternalIdsPatterns on ExternalIds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExternalIds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExternalIds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExternalIds value)  $default,){
final _that = this;
switch (_that) {
case _ExternalIds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExternalIds value)?  $default,){
final _that = this;
switch (_that) {
case _ExternalIds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'wikidata_id')  String? wikidataId, @JsonKey(name: 'facebook_id')  dynamic facebookId, @JsonKey(name: 'instagram_id')  String? instagramId, @JsonKey(name: 'twitter_id')  String? twitterId, @JsonKey(name: 'freebase_mid')  dynamic freebaseMid, @JsonKey(name: 'freebase_id')  dynamic freebaseId, @JsonKey(name: 'tvdb_id')  int? tvdbId, @JsonKey(name: 'tvrage_id')  dynamic tvrageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExternalIds() when $default != null:
return $default(_that.imdbId,_that.wikidataId,_that.facebookId,_that.instagramId,_that.twitterId,_that.freebaseMid,_that.freebaseId,_that.tvdbId,_that.tvrageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'wikidata_id')  String? wikidataId, @JsonKey(name: 'facebook_id')  dynamic facebookId, @JsonKey(name: 'instagram_id')  String? instagramId, @JsonKey(name: 'twitter_id')  String? twitterId, @JsonKey(name: 'freebase_mid')  dynamic freebaseMid, @JsonKey(name: 'freebase_id')  dynamic freebaseId, @JsonKey(name: 'tvdb_id')  int? tvdbId, @JsonKey(name: 'tvrage_id')  dynamic tvrageId)  $default,) {final _that = this;
switch (_that) {
case _ExternalIds():
return $default(_that.imdbId,_that.wikidataId,_that.facebookId,_that.instagramId,_that.twitterId,_that.freebaseMid,_that.freebaseId,_that.tvdbId,_that.tvrageId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'imdb_id')  String? imdbId, @JsonKey(name: 'wikidata_id')  String? wikidataId, @JsonKey(name: 'facebook_id')  dynamic facebookId, @JsonKey(name: 'instagram_id')  String? instagramId, @JsonKey(name: 'twitter_id')  String? twitterId, @JsonKey(name: 'freebase_mid')  dynamic freebaseMid, @JsonKey(name: 'freebase_id')  dynamic freebaseId, @JsonKey(name: 'tvdb_id')  int? tvdbId, @JsonKey(name: 'tvrage_id')  dynamic tvrageId)?  $default,) {final _that = this;
switch (_that) {
case _ExternalIds() when $default != null:
return $default(_that.imdbId,_that.wikidataId,_that.facebookId,_that.instagramId,_that.twitterId,_that.freebaseMid,_that.freebaseId,_that.tvdbId,_that.tvrageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExternalIds implements ExternalIds {
  const _ExternalIds({@JsonKey(name: 'imdb_id') this.imdbId, @JsonKey(name: 'wikidata_id') this.wikidataId, @JsonKey(name: 'facebook_id') this.facebookId, @JsonKey(name: 'instagram_id') this.instagramId, @JsonKey(name: 'twitter_id') this.twitterId, @JsonKey(name: 'freebase_mid') this.freebaseMid, @JsonKey(name: 'freebase_id') this.freebaseId, @JsonKey(name: 'tvdb_id') this.tvdbId, @JsonKey(name: 'tvrage_id') this.tvrageId});
  factory _ExternalIds.fromJson(Map<String, dynamic> json) => _$ExternalIdsFromJson(json);

@override@JsonKey(name: 'imdb_id') final  String? imdbId;
@override@JsonKey(name: 'wikidata_id') final  String? wikidataId;
@override@JsonKey(name: 'facebook_id') final  dynamic facebookId;
@override@JsonKey(name: 'instagram_id') final  String? instagramId;
@override@JsonKey(name: 'twitter_id') final  String? twitterId;
@override@JsonKey(name: 'freebase_mid') final  dynamic freebaseMid;
@override@JsonKey(name: 'freebase_id') final  dynamic freebaseId;
@override@JsonKey(name: 'tvdb_id') final  int? tvdbId;
@override@JsonKey(name: 'tvrage_id') final  dynamic tvrageId;

/// Create a copy of ExternalIds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExternalIdsCopyWith<_ExternalIds> get copyWith => __$ExternalIdsCopyWithImpl<_ExternalIds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExternalIdsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExternalIds&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.wikidataId, wikidataId) || other.wikidataId == wikidataId)&&const DeepCollectionEquality().equals(other.facebookId, facebookId)&&(identical(other.instagramId, instagramId) || other.instagramId == instagramId)&&(identical(other.twitterId, twitterId) || other.twitterId == twitterId)&&const DeepCollectionEquality().equals(other.freebaseMid, freebaseMid)&&const DeepCollectionEquality().equals(other.freebaseId, freebaseId)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&const DeepCollectionEquality().equals(other.tvrageId, tvrageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imdbId,wikidataId,const DeepCollectionEquality().hash(facebookId),instagramId,twitterId,const DeepCollectionEquality().hash(freebaseMid),const DeepCollectionEquality().hash(freebaseId),tvdbId,const DeepCollectionEquality().hash(tvrageId));

@override
String toString() {
  return 'ExternalIds(imdbId: $imdbId, wikidataId: $wikidataId, facebookId: $facebookId, instagramId: $instagramId, twitterId: $twitterId, freebaseMid: $freebaseMid, freebaseId: $freebaseId, tvdbId: $tvdbId, tvrageId: $tvrageId)';
}


}

/// @nodoc
abstract mixin class _$ExternalIdsCopyWith<$Res> implements $ExternalIdsCopyWith<$Res> {
  factory _$ExternalIdsCopyWith(_ExternalIds value, $Res Function(_ExternalIds) _then) = __$ExternalIdsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'imdb_id') String? imdbId,@JsonKey(name: 'wikidata_id') String? wikidataId,@JsonKey(name: 'facebook_id') dynamic facebookId,@JsonKey(name: 'instagram_id') String? instagramId,@JsonKey(name: 'twitter_id') String? twitterId,@JsonKey(name: 'freebase_mid') dynamic freebaseMid,@JsonKey(name: 'freebase_id') dynamic freebaseId,@JsonKey(name: 'tvdb_id') int? tvdbId,@JsonKey(name: 'tvrage_id') dynamic tvrageId
});




}
/// @nodoc
class __$ExternalIdsCopyWithImpl<$Res>
    implements _$ExternalIdsCopyWith<$Res> {
  __$ExternalIdsCopyWithImpl(this._self, this._then);

  final _ExternalIds _self;
  final $Res Function(_ExternalIds) _then;

/// Create a copy of ExternalIds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imdbId = freezed,Object? wikidataId = freezed,Object? facebookId = freezed,Object? instagramId = freezed,Object? twitterId = freezed,Object? freebaseMid = freezed,Object? freebaseId = freezed,Object? tvdbId = freezed,Object? tvrageId = freezed,}) {
  return _then(_ExternalIds(
imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,wikidataId: freezed == wikidataId ? _self.wikidataId : wikidataId // ignore: cast_nullable_to_non_nullable
as String?,facebookId: freezed == facebookId ? _self.facebookId : facebookId // ignore: cast_nullable_to_non_nullable
as dynamic,instagramId: freezed == instagramId ? _self.instagramId : instagramId // ignore: cast_nullable_to_non_nullable
as String?,twitterId: freezed == twitterId ? _self.twitterId : twitterId // ignore: cast_nullable_to_non_nullable
as String?,freebaseMid: freezed == freebaseMid ? _self.freebaseMid : freebaseMid // ignore: cast_nullable_to_non_nullable
as dynamic,freebaseId: freezed == freebaseId ? _self.freebaseId : freebaseId // ignore: cast_nullable_to_non_nullable
as dynamic,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,tvrageId: freezed == tvrageId ? _self.tvrageId : tvrageId // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$Genre {

 int? get id; String? get name;
/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreCopyWith<Genre> get copyWith => _$GenreCopyWithImpl<Genre>(this as Genre, _$identity);

  /// Serializes this Genre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Genre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Genre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $GenreCopyWith<$Res>  {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) _then) = _$GenreCopyWithImpl;
@useResult
$Res call({
 int? id, String? name
});




}
/// @nodoc
class _$GenreCopyWithImpl<$Res>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._self, this._then);

  final Genre _self;
  final $Res Function(Genre) _then;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Genre].
extension GenrePatterns on Genre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Genre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Genre() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Genre value)  $default,){
final _that = this;
switch (_that) {
case _Genre():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Genre value)?  $default,){
final _that = this;
switch (_that) {
case _Genre() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _Genre():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Genre implements Genre {
  const _Genre({this.id, this.name});
  factory _Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

@override final  int? id;
@override final  String? name;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreCopyWith<_Genre> get copyWith => __$GenreCopyWithImpl<_Genre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Genre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Genre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) _then) = __$GenreCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name
});




}
/// @nodoc
class __$GenreCopyWithImpl<$Res>
    implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(this._self, this._then);

  final _Genre _self;
  final $Res Function(_Genre) _then;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_Genre(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TEpisodeToAir {

 int? get id; String? get name; String? get overview;@JsonKey(name: 'vote_average') int? get voteAverage;@JsonKey(name: 'vote_count') int? get voteCount;@JsonKey(name: 'air_date') DateTime? get airDate;@JsonKey(name: 'episode_number') int? get episodeNumber;@JsonKey(name: 'episode_type') String? get episodeType;@JsonKey(name: 'production_code') String? get productionCode; int? get runtime;@JsonKey(name: 'season_number') int? get seasonNumber;@JsonKey(name: 'show_id') int? get showId;@JsonKey(name: 'still_path') String? get stillPath;
/// Create a copy of TEpisodeToAir
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TEpisodeToAirCopyWith<TEpisodeToAir> get copyWith => _$TEpisodeToAirCopyWithImpl<TEpisodeToAir>(this as TEpisodeToAir, _$identity);

  /// Serializes this TEpisodeToAir to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TEpisodeToAir&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.productionCode, productionCode) || other.productionCode == productionCode)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.showId, showId) || other.showId == showId)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,overview,voteAverage,voteCount,airDate,episodeNumber,episodeType,productionCode,runtime,seasonNumber,showId,stillPath);

@override
String toString() {
  return 'TEpisodeToAir(id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath)';
}


}

/// @nodoc
abstract mixin class $TEpisodeToAirCopyWith<$Res>  {
  factory $TEpisodeToAirCopyWith(TEpisodeToAir value, $Res Function(TEpisodeToAir) _then) = _$TEpisodeToAirCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? overview,@JsonKey(name: 'vote_average') int? voteAverage,@JsonKey(name: 'vote_count') int? voteCount,@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_number') int? episodeNumber,@JsonKey(name: 'episode_type') String? episodeType,@JsonKey(name: 'production_code') String? productionCode, int? runtime,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'show_id') int? showId,@JsonKey(name: 'still_path') String? stillPath
});




}
/// @nodoc
class _$TEpisodeToAirCopyWithImpl<$Res>
    implements $TEpisodeToAirCopyWith<$Res> {
  _$TEpisodeToAirCopyWithImpl(this._self, this._then);

  final TEpisodeToAir _self;
  final $Res Function(TEpisodeToAir) _then;

/// Create a copy of TEpisodeToAir
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? airDate = freezed,Object? episodeNumber = freezed,Object? episodeType = freezed,Object? productionCode = freezed,Object? runtime = freezed,Object? seasonNumber = freezed,Object? showId = freezed,Object? stillPath = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as int?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,productionCode: freezed == productionCode ? _self.productionCode : productionCode // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,showId: freezed == showId ? _self.showId : showId // ignore: cast_nullable_to_non_nullable
as int?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TEpisodeToAir].
extension TEpisodeToAirPatterns on TEpisodeToAir {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TEpisodeToAir value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TEpisodeToAir() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TEpisodeToAir value)  $default,){
final _that = this;
switch (_that) {
case _TEpisodeToAir():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TEpisodeToAir value)?  $default,){
final _that = this;
switch (_that) {
case _TEpisodeToAir() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? overview, @JsonKey(name: 'vote_average')  int? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TEpisodeToAir() when $default != null:
return $default(_that.id,_that.name,_that.overview,_that.voteAverage,_that.voteCount,_that.airDate,_that.episodeNumber,_that.episodeType,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? overview, @JsonKey(name: 'vote_average')  int? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath)  $default,) {final _that = this;
switch (_that) {
case _TEpisodeToAir():
return $default(_that.id,_that.name,_that.overview,_that.voteAverage,_that.voteCount,_that.airDate,_that.episodeNumber,_that.episodeType,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? overview, @JsonKey(name: 'vote_average')  int? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount, @JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_number')  int? episodeNumber, @JsonKey(name: 'episode_type')  String? episodeType, @JsonKey(name: 'production_code')  String? productionCode,  int? runtime, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'show_id')  int? showId, @JsonKey(name: 'still_path')  String? stillPath)?  $default,) {final _that = this;
switch (_that) {
case _TEpisodeToAir() when $default != null:
return $default(_that.id,_that.name,_that.overview,_that.voteAverage,_that.voteCount,_that.airDate,_that.episodeNumber,_that.episodeType,_that.productionCode,_that.runtime,_that.seasonNumber,_that.showId,_that.stillPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TEpisodeToAir implements TEpisodeToAir {
  const _TEpisodeToAir({this.id, this.name, this.overview, @JsonKey(name: 'vote_average') this.voteAverage, @JsonKey(name: 'vote_count') this.voteCount, @JsonKey(name: 'air_date') this.airDate, @JsonKey(name: 'episode_number') this.episodeNumber, @JsonKey(name: 'episode_type') this.episodeType, @JsonKey(name: 'production_code') this.productionCode, this.runtime, @JsonKey(name: 'season_number') this.seasonNumber, @JsonKey(name: 'show_id') this.showId, @JsonKey(name: 'still_path') this.stillPath});
  factory _TEpisodeToAir.fromJson(Map<String, dynamic> json) => _$TEpisodeToAirFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? overview;
@override@JsonKey(name: 'vote_average') final  int? voteAverage;
@override@JsonKey(name: 'vote_count') final  int? voteCount;
@override@JsonKey(name: 'air_date') final  DateTime? airDate;
@override@JsonKey(name: 'episode_number') final  int? episodeNumber;
@override@JsonKey(name: 'episode_type') final  String? episodeType;
@override@JsonKey(name: 'production_code') final  String? productionCode;
@override final  int? runtime;
@override@JsonKey(name: 'season_number') final  int? seasonNumber;
@override@JsonKey(name: 'show_id') final  int? showId;
@override@JsonKey(name: 'still_path') final  String? stillPath;

/// Create a copy of TEpisodeToAir
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TEpisodeToAirCopyWith<_TEpisodeToAir> get copyWith => __$TEpisodeToAirCopyWithImpl<_TEpisodeToAir>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TEpisodeToAirToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TEpisodeToAir&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.productionCode, productionCode) || other.productionCode == productionCode)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.showId, showId) || other.showId == showId)&&(identical(other.stillPath, stillPath) || other.stillPath == stillPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,overview,voteAverage,voteCount,airDate,episodeNumber,episodeType,productionCode,runtime,seasonNumber,showId,stillPath);

@override
String toString() {
  return 'TEpisodeToAir(id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath)';
}


}

/// @nodoc
abstract mixin class _$TEpisodeToAirCopyWith<$Res> implements $TEpisodeToAirCopyWith<$Res> {
  factory _$TEpisodeToAirCopyWith(_TEpisodeToAir value, $Res Function(_TEpisodeToAir) _then) = __$TEpisodeToAirCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? overview,@JsonKey(name: 'vote_average') int? voteAverage,@JsonKey(name: 'vote_count') int? voteCount,@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_number') int? episodeNumber,@JsonKey(name: 'episode_type') String? episodeType,@JsonKey(name: 'production_code') String? productionCode, int? runtime,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'show_id') int? showId,@JsonKey(name: 'still_path') String? stillPath
});




}
/// @nodoc
class __$TEpisodeToAirCopyWithImpl<$Res>
    implements _$TEpisodeToAirCopyWith<$Res> {
  __$TEpisodeToAirCopyWithImpl(this._self, this._then);

  final _TEpisodeToAir _self;
  final $Res Function(_TEpisodeToAir) _then;

/// Create a copy of TEpisodeToAir
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? airDate = freezed,Object? episodeNumber = freezed,Object? episodeType = freezed,Object? productionCode = freezed,Object? runtime = freezed,Object? seasonNumber = freezed,Object? showId = freezed,Object? stillPath = freezed,}) {
  return _then(_TEpisodeToAir(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as int?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,productionCode: freezed == productionCode ? _self.productionCode : productionCode // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,showId: freezed == showId ? _self.showId : showId // ignore: cast_nullable_to_non_nullable
as int?,stillPath: freezed == stillPath ? _self.stillPath : stillPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Network {

 int? get id;@JsonKey(name: 'logo_path') String? get logoPath; String? get name;@JsonKey(name: 'origin_country') String? get originCountry;
/// Create a copy of Network
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkCopyWith<Network> get copyWith => _$NetworkCopyWithImpl<Network>(this as Network, _$identity);

  /// Serializes this Network to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Network&&(identical(other.id, id) || other.id == id)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.name, name) || other.name == name)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logoPath,name,originCountry);

@override
String toString() {
  return 'Network(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
}


}

/// @nodoc
abstract mixin class $NetworkCopyWith<$Res>  {
  factory $NetworkCopyWith(Network value, $Res Function(Network) _then) = _$NetworkCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'logo_path') String? logoPath, String? name,@JsonKey(name: 'origin_country') String? originCountry
});




}
/// @nodoc
class _$NetworkCopyWithImpl<$Res>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(this._self, this._then);

  final Network _self;
  final $Res Function(Network) _then;

/// Create a copy of Network
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? logoPath = freezed,Object? name = freezed,Object? originCountry = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Network].
extension NetworkPatterns on Network {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Network value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Network() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Network value)  $default,){
final _that = this;
switch (_that) {
case _Network():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Network value)?  $default,){
final _that = this;
switch (_that) {
case _Network() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'logo_path')  String? logoPath,  String? name, @JsonKey(name: 'origin_country')  String? originCountry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Network() when $default != null:
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'logo_path')  String? logoPath,  String? name, @JsonKey(name: 'origin_country')  String? originCountry)  $default,) {final _that = this;
switch (_that) {
case _Network():
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'logo_path')  String? logoPath,  String? name, @JsonKey(name: 'origin_country')  String? originCountry)?  $default,) {final _that = this;
switch (_that) {
case _Network() when $default != null:
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Network implements Network {
  const _Network({this.id, @JsonKey(name: 'logo_path') this.logoPath, this.name, @JsonKey(name: 'origin_country') this.originCountry});
  factory _Network.fromJson(Map<String, dynamic> json) => _$NetworkFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'logo_path') final  String? logoPath;
@override final  String? name;
@override@JsonKey(name: 'origin_country') final  String? originCountry;

/// Create a copy of Network
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkCopyWith<_Network> get copyWith => __$NetworkCopyWithImpl<_Network>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NetworkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Network&&(identical(other.id, id) || other.id == id)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.name, name) || other.name == name)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logoPath,name,originCountry);

@override
String toString() {
  return 'Network(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
}


}

/// @nodoc
abstract mixin class _$NetworkCopyWith<$Res> implements $NetworkCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) _then) = __$NetworkCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'logo_path') String? logoPath, String? name,@JsonKey(name: 'origin_country') String? originCountry
});




}
/// @nodoc
class __$NetworkCopyWithImpl<$Res>
    implements _$NetworkCopyWith<$Res> {
  __$NetworkCopyWithImpl(this._self, this._then);

  final _Network _self;
  final $Res Function(_Network) _then;

/// Create a copy of Network
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? logoPath = freezed,Object? name = freezed,Object? originCountry = freezed,}) {
  return _then(_Network(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductionCountry {

@JsonKey(name: 'iso_3166_1') String? get iso31661; String? get name;
/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionCountryCopyWith<ProductionCountry> get copyWith => _$ProductionCountryCopyWithImpl<ProductionCountry>(this as ProductionCountry, _$identity);

  /// Serializes this ProductionCountry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionCountry&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso31661,name);

@override
String toString() {
  return 'ProductionCountry(iso31661: $iso31661, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProductionCountryCopyWith<$Res>  {
  factory $ProductionCountryCopyWith(ProductionCountry value, $Res Function(ProductionCountry) _then) = _$ProductionCountryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String? iso31661, String? name
});




}
/// @nodoc
class _$ProductionCountryCopyWithImpl<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._self, this._then);

  final ProductionCountry _self;
  final $Res Function(ProductionCountry) _then;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iso31661 = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
iso31661: freezed == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionCountry].
extension ProductionCountryPatterns on ProductionCountry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionCountry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionCountry value)  $default,){
final _that = this;
switch (_that) {
case _ProductionCountry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionCountry value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String? iso31661,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that.iso31661,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String? iso31661,  String? name)  $default,) {final _that = this;
switch (_that) {
case _ProductionCountry():
return $default(_that.iso31661,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'iso_3166_1')  String? iso31661,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that.iso31661,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionCountry implements ProductionCountry {
  const _ProductionCountry({@JsonKey(name: 'iso_3166_1') this.iso31661, this.name});
  factory _ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

@override@JsonKey(name: 'iso_3166_1') final  String? iso31661;
@override final  String? name;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionCountryCopyWith<_ProductionCountry> get copyWith => __$ProductionCountryCopyWithImpl<_ProductionCountry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionCountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionCountry&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso31661,name);

@override
String toString() {
  return 'ProductionCountry(iso31661: $iso31661, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProductionCountryCopyWith<$Res> implements $ProductionCountryCopyWith<$Res> {
  factory _$ProductionCountryCopyWith(_ProductionCountry value, $Res Function(_ProductionCountry) _then) = __$ProductionCountryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String? iso31661, String? name
});




}
/// @nodoc
class __$ProductionCountryCopyWithImpl<$Res>
    implements _$ProductionCountryCopyWith<$Res> {
  __$ProductionCountryCopyWithImpl(this._self, this._then);

  final _ProductionCountry _self;
  final $Res Function(_ProductionCountry) _then;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iso31661 = freezed,Object? name = freezed,}) {
  return _then(_ProductionCountry(
iso31661: freezed == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Season {

@JsonKey(name: 'air_date') DateTime? get airDate;@JsonKey(name: 'episode_count') int? get episodeCount; int? get id; String? get name; String? get overview;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'season_number') int? get seasonNumber;@JsonKey(name: 'vote_average') int? get voteAverage;
/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonCopyWith<Season> get copyWith => _$SeasonCopyWithImpl<Season>(this as Season, _$identity);

  /// Serializes this Season to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Season&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeCount,id,name,overview,posterPath,seasonNumber,voteAverage);

@override
String toString() {
  return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class $SeasonCopyWith<$Res>  {
  factory $SeasonCopyWith(Season value, $Res Function(Season) _then) = _$SeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_count') int? episodeCount, int? id, String? name, String? overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'vote_average') int? voteAverage
});




}
/// @nodoc
class _$SeasonCopyWithImpl<$Res>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._self, this._then);

  final Season _self;
  final $Res Function(Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airDate = freezed,Object? episodeCount = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? seasonNumber = freezed,Object? voteAverage = freezed,}) {
  return _then(_self.copyWith(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Season].
extension SeasonPatterns on Season {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Season value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Season value)  $default,){
final _that = this;
switch (_that) {
case _Season():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Season value)?  $default,){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'vote_average')  int? voteAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.posterPath,_that.seasonNumber,_that.voteAverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'vote_average')  int? voteAverage)  $default,) {final _that = this;
switch (_that) {
case _Season():
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.posterPath,_that.seasonNumber,_that.voteAverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'air_date')  DateTime? airDate, @JsonKey(name: 'episode_count')  int? episodeCount,  int? id,  String? name,  String? overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'season_number')  int? seasonNumber, @JsonKey(name: 'vote_average')  int? voteAverage)?  $default,) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.airDate,_that.episodeCount,_that.id,_that.name,_that.overview,_that.posterPath,_that.seasonNumber,_that.voteAverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Season implements Season {
  const _Season({@JsonKey(name: 'air_date') this.airDate, @JsonKey(name: 'episode_count') this.episodeCount, this.id, this.name, this.overview, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'season_number') this.seasonNumber, @JsonKey(name: 'vote_average') this.voteAverage});
  factory _Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

@override@JsonKey(name: 'air_date') final  DateTime? airDate;
@override@JsonKey(name: 'episode_count') final  int? episodeCount;
@override final  int? id;
@override final  String? name;
@override final  String? overview;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'season_number') final  int? seasonNumber;
@override@JsonKey(name: 'vote_average') final  int? voteAverage;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonCopyWith<_Season> get copyWith => __$SeasonCopyWithImpl<_Season>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Season&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airDate,episodeCount,id,name,overview,posterPath,seasonNumber,voteAverage);

@override
String toString() {
  return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class _$SeasonCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$SeasonCopyWith(_Season value, $Res Function(_Season) _then) = __$SeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'air_date') DateTime? airDate,@JsonKey(name: 'episode_count') int? episodeCount, int? id, String? name, String? overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'season_number') int? seasonNumber,@JsonKey(name: 'vote_average') int? voteAverage
});




}
/// @nodoc
class __$SeasonCopyWithImpl<$Res>
    implements _$SeasonCopyWith<$Res> {
  __$SeasonCopyWithImpl(this._self, this._then);

  final _Season _self;
  final $Res Function(_Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airDate = freezed,Object? episodeCount = freezed,Object? id = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? seasonNumber = freezed,Object? voteAverage = freezed,}) {
  return _then(_Season(
airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeCount: freezed == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SpokenLanguage {

@JsonKey(name: 'english_name') String? get englishName;@JsonKey(name: 'iso_639_1') String? get iso6391; String? get name;
/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpokenLanguageCopyWith<SpokenLanguage> get copyWith => _$SpokenLanguageCopyWithImpl<SpokenLanguage>(this as SpokenLanguage, _$identity);

  /// Serializes this SpokenLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpokenLanguage&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishName,iso6391,name);

@override
String toString() {
  return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
}


}

/// @nodoc
abstract mixin class $SpokenLanguageCopyWith<$Res>  {
  factory $SpokenLanguageCopyWith(SpokenLanguage value, $Res Function(SpokenLanguage) _then) = _$SpokenLanguageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'english_name') String? englishName,@JsonKey(name: 'iso_639_1') String? iso6391, String? name
});




}
/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._self, this._then);

  final SpokenLanguage _self;
  final $Res Function(SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? englishName = freezed,Object? iso6391 = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
englishName: freezed == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String?,iso6391: freezed == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpokenLanguage].
extension SpokenLanguagePatterns on SpokenLanguage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpokenLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpokenLanguage value)  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpokenLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'english_name')  String? englishName, @JsonKey(name: 'iso_639_1')  String? iso6391,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.englishName,_that.iso6391,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'english_name')  String? englishName, @JsonKey(name: 'iso_639_1')  String? iso6391,  String? name)  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage():
return $default(_that.englishName,_that.iso6391,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'english_name')  String? englishName, @JsonKey(name: 'iso_639_1')  String? iso6391,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.englishName,_that.iso6391,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpokenLanguage implements SpokenLanguage {
  const _SpokenLanguage({@JsonKey(name: 'english_name') this.englishName, @JsonKey(name: 'iso_639_1') this.iso6391, this.name});
  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

@override@JsonKey(name: 'english_name') final  String? englishName;
@override@JsonKey(name: 'iso_639_1') final  String? iso6391;
@override final  String? name;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith => __$SpokenLanguageCopyWithImpl<_SpokenLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpokenLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpokenLanguage&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishName,iso6391,name);

@override
String toString() {
  return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SpokenLanguageCopyWith<$Res> implements $SpokenLanguageCopyWith<$Res> {
  factory _$SpokenLanguageCopyWith(_SpokenLanguage value, $Res Function(_SpokenLanguage) _then) = __$SpokenLanguageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'english_name') String? englishName,@JsonKey(name: 'iso_639_1') String? iso6391, String? name
});




}
/// @nodoc
class __$SpokenLanguageCopyWithImpl<$Res>
    implements _$SpokenLanguageCopyWith<$Res> {
  __$SpokenLanguageCopyWithImpl(this._self, this._then);

  final _SpokenLanguage _self;
  final $Res Function(_SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? englishName = freezed,Object? iso6391 = freezed,Object? name = freezed,}) {
  return _then(_SpokenLanguage(
englishName: freezed == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String?,iso6391: freezed == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
