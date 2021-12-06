import 'package:json_annotation/json_annotation.dart';

part 'movie_cover_model.g.dart';

@JsonSerializable()
class MovieCoverModel {
  final bool? adult;
  final String? backdrop_path;
  final List<int>? genre_ids;
  final int id;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final double? popularity;
  final String? poster_path;
  final String? release_date;
  final String? title;
  final bool? video;
  final double? vote_average;
  final double? vote_count;

  MovieCoverModel(
      {this.adult,
      this.backdrop_path,
      this.genre_ids,
      required this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  factory MovieCoverModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCoverModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCoverModelToJson(this);
}
