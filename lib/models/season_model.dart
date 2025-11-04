import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_model.freezed.dart';
part 'season_model.g.dart';

@freezed
abstract class SeasonModel with _$SeasonModel {
  const factory SeasonModel({List<Episode>? episodes}) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
}

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    @JsonKey(name: 'air_date') DateTime? airDate,
    @JsonKey(name: 'episode_number') int? episodeNumber,
    @JsonKey(name: 'episode_type') String? episodeType,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'production_code') String? productionCode,
    int? runtime,
    @JsonKey(name: 'season_number') int? seasonNumber,
    @JsonKey(name: 'show_id') int? showId,
    @JsonKey(name: 'still_path') String? stillPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    List<Crew>? crew,
    @JsonKey(name: 'guest_stars') List<Crew>? guestStars,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

@freezed
abstract class Crew with _$Crew {
  const factory Crew({
    String? job,
    String? department,
    @JsonKey(name: 'credit_id') String? creditId,
    bool? adult,
    int? gender,
    int? id,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    String? name,
    @JsonKey(name: 'original_name') String? originalName,
    double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    String? character,
    int? order,
  }) = _Crew;

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}
