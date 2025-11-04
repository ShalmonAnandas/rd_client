// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => _SeasonModel(
  episodes: (json['episodes'] as List<dynamic>?)
      ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SeasonModelToJson(_SeasonModel instance) =>
    <String, dynamic>{'episodes': instance.episodes};

_Episode _$EpisodeFromJson(Map<String, dynamic> json) => _Episode(
  airDate: json['air_date'] == null
      ? null
      : DateTime.parse(json['air_date'] as String),
  episodeNumber: (json['episode_number'] as num?)?.toInt(),
  episodeType: json['episode_type'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  productionCode: json['production_code'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  showId: (json['show_id'] as num?)?.toInt(),
  stillPath: json['still_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
      .toList(),
  guestStars: (json['guest_stars'] as List<dynamic>?)
      ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EpisodeToJson(_Episode instance) => <String, dynamic>{
  'air_date': instance.airDate?.toIso8601String(),
  'episode_number': instance.episodeNumber,
  'episode_type': instance.episodeType,
  'id': instance.id,
  'name': instance.name,
  'overview': instance.overview,
  'production_code': instance.productionCode,
  'runtime': instance.runtime,
  'season_number': instance.seasonNumber,
  'show_id': instance.showId,
  'still_path': instance.stillPath,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'crew': instance.crew,
  'guest_stars': instance.guestStars,
};

_Crew _$CrewFromJson(Map<String, dynamic> json) => _Crew(
  job: json['job'] as String?,
  department: json['department'] as String?,
  creditId: json['credit_id'] as String?,
  adult: json['adult'] as bool?,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  knownForDepartment: json['known_for_department'] as String?,
  name: json['name'] as String?,
  originalName: json['original_name'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  profilePath: json['profile_path'] as String?,
  character: json['character'] as String?,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$CrewToJson(_Crew instance) => <String, dynamic>{
  'job': instance.job,
  'department': instance.department,
  'credit_id': instance.creditId,
  'adult': instance.adult,
  'gender': instance.gender,
  'id': instance.id,
  'known_for_department': instance.knownForDepartment,
  'name': instance.name,
  'original_name': instance.originalName,
  'popularity': instance.popularity,
  'profile_path': instance.profilePath,
  'character': instance.character,
  'order': instance.order,
};
