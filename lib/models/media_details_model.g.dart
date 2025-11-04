// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaDetailsModel _$MediaDetailsModelFromJson(Map<String, dynamic> json) =>
    _MediaDetailsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'],
      budget: (json['budget'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt(),
      imdbId: json['imdb_id'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      revenue: (json['revenue'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      externalIds: json['external_ids'] == null
          ? null
          : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      createdBy: (json['created_by'] as List<dynamic>?)
          ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: json['episode_run_time'] as List<dynamic>?,
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      inProduction: json['in_production'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['last_air_date'] == null
          ? null
          : DateTime.parse(json['last_air_date'] as String),
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : TEpisodeToAir.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      nextEpisodeToAir: json['next_episode_to_air'] == null
          ? null
          : TEpisodeToAir.fromJson(
              json['next_episode_to_air'] as Map<String, dynamic>,
            ),
      networks: (json['networks'] as List<dynamic>?)
          ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt(),
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      originalName: json['original_name'] as String?,
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MediaDetailsModelToJson(_MediaDetailsModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate?.toIso8601String(),
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'external_ids': instance.externalIds,
      'created_by': instance.createdBy,
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate?.toIso8601String(),
      'last_episode_to_air': instance.lastEpisodeToAir,
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'original_name': instance.originalName,
      'seasons': instance.seasons,
      'type': instance.type,
    };

_CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => _CreatedBy(
  id: (json['id'] as num?)?.toInt(),
  creditId: json['credit_id'] as String?,
  name: json['name'] as String?,
  originalName: json['original_name'] as String?,
  gender: (json['gender'] as num?)?.toInt(),
  profilePath: json['profile_path'],
);

Map<String, dynamic> _$CreatedByToJson(_CreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'original_name': instance.originalName,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };

_ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => _ExternalIds(
  imdbId: json['imdb_id'] as String?,
  wikidataId: json['wikidata_id'] as String?,
  facebookId: json['facebook_id'],
  instagramId: json['instagram_id'] as String?,
  twitterId: json['twitter_id'] as String?,
  freebaseMid: json['freebase_mid'],
  freebaseId: json['freebase_id'],
  tvdbId: (json['tvdb_id'] as num?)?.toInt(),
  tvrageId: json['tvrage_id'],
);

Map<String, dynamic> _$ExternalIdsToJson(_ExternalIds instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'wikidata_id': instance.wikidataId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'twitter_id': instance.twitterId,
      'freebase_mid': instance.freebaseMid,
      'freebase_id': instance.freebaseId,
      'tvdb_id': instance.tvdbId,
      'tvrage_id': instance.tvrageId,
    };

_Genre _$GenreFromJson(Map<String, dynamic> json) =>
    _Genre(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_TEpisodeToAir _$TEpisodeToAirFromJson(Map<String, dynamic> json) =>
    _TEpisodeToAir(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toInt(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodeNumber: (json['episode_number'] as num?)?.toInt(),
      episodeType: json['episode_type'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      showId: (json['show_id'] as num?)?.toInt(),
      stillPath: json['still_path'] as String?,
    );

Map<String, dynamic> _$TEpisodeToAirToJson(_TEpisodeToAir instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
    };

_Network _$NetworkFromJson(Map<String, dynamic> json) => _Network(
  id: (json['id'] as num?)?.toInt(),
  logoPath: json['logo_path'] as String?,
  name: json['name'] as String?,
  originCountry: json['origin_country'] as String?,
);

Map<String, dynamic> _$NetworkToJson(_Network instance) => <String, dynamic>{
  'id': instance.id,
  'logo_path': instance.logoPath,
  'name': instance.name,
  'origin_country': instance.originCountry,
};

_ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    _ProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountryToJson(_ProductionCountry instance) =>
    <String, dynamic>{'iso_3166_1': instance.iso31661, 'name': instance.name};

_Season _$SeasonFromJson(Map<String, dynamic> json) => _Season(
  airDate: json['air_date'] == null
      ? null
      : DateTime.parse(json['air_date'] as String),
  episodeCount: (json['episode_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  voteAverage: (json['vote_average'] as num?)?.toInt(),
);

Map<String, dynamic> _$SeasonToJson(_Season instance) => <String, dynamic>{
  'air_date': instance.airDate?.toIso8601String(),
  'episode_count': instance.episodeCount,
  'id': instance.id,
  'name': instance.name,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'season_number': instance.seasonNumber,
  'vote_average': instance.voteAverage,
};

_SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    _SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(_SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
