import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_details_model.freezed.dart';
part 'media_details_model.g.dart';

@freezed
abstract class MediaDetailsModel with _$MediaDetailsModel {
  const factory MediaDetailsModel({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<Network>? productionCompanies,
    @JsonKey(name: 'production_countries')
    List<ProductionCountry>? productionCountries,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    int? revenue,
    int? runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'external_ids') ExternalIds? externalIds,
    @JsonKey(name: 'created_by') List<CreatedBy>? createdBy,
    @JsonKey(name: 'episode_run_time') List<dynamic>? episodeRunTime,
    @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
    @JsonKey(name: 'in_production') bool? inProduction,
    List<String>? languages,
    @JsonKey(name: 'last_air_date') DateTime? lastAirDate,
    @JsonKey(name: 'last_episode_to_air') TEpisodeToAir? lastEpisodeToAir,
    String? name,
    @JsonKey(name: 'next_episode_to_air') TEpisodeToAir? nextEpisodeToAir,
    List<Network>? networks,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'original_name') String? originalName,
    List<Season>? seasons,
    String? type,
  }) = _MediaDetailsModel;

  factory MediaDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MediaDetailsModelFromJson(json);
}

@freezed
abstract class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    int? id,
    @JsonKey(name: 'credit_id') String? creditId,
    String? name,
    @JsonKey(name: 'original_name') String? originalName,
    int? gender,
    @JsonKey(name: 'profile_path') dynamic profilePath,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
abstract class ExternalIds with _$ExternalIds {
  const factory ExternalIds({
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'wikidata_id') String? wikidataId,
    @JsonKey(name: 'facebook_id') dynamic facebookId,
    @JsonKey(name: 'instagram_id') String? instagramId,
    @JsonKey(name: 'twitter_id') String? twitterId,
    @JsonKey(name: 'freebase_mid') dynamic freebaseMid,
    @JsonKey(name: 'freebase_id') dynamic freebaseId,
    @JsonKey(name: 'tvdb_id') int? tvdbId,
    @JsonKey(name: 'tvrage_id') dynamic tvrageId,
  }) = _ExternalIds;

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  const factory Genre({int? id, String? name}) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
abstract class TEpisodeToAir with _$TEpisodeToAir {
  const factory TEpisodeToAir({
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'vote_average') int? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'air_date') DateTime? airDate,
    @JsonKey(name: 'episode_number') int? episodeNumber,
    @JsonKey(name: 'episode_type') String? episodeType,
    @JsonKey(name: 'production_code') String? productionCode,
    int? runtime,
    @JsonKey(name: 'season_number') int? seasonNumber,
    @JsonKey(name: 'show_id') int? showId,
    @JsonKey(name: 'still_path') String? stillPath,
  }) = _TEpisodeToAir;

  factory TEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$TEpisodeToAirFromJson(json);
}

@freezed
abstract class Network with _$Network {
  const factory Network({
    int? id,
    @JsonKey(name: 'logo_path') String? logoPath,
    String? name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
}

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
abstract class Season with _$Season {
  const factory Season({
    @JsonKey(name: 'air_date') DateTime? airDate,
    @JsonKey(name: 'episode_count') int? episodeCount,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') int? seasonNumber,
    @JsonKey(name: 'vote_average') int? voteAverage,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
