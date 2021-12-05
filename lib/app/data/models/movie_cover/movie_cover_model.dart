import 'package:json_annotation/json_annotation.dart';

part 'movie_cover_model.g.dart';

@JsonSerializable()
class MovieCoverModel {
  final bool adult;
  final String backdrop_path;
  final List<int> genre_ids;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final DateTime release_date;
  final String title;
  final bool video;
  final double vote_average;
  final double vote_count;

  MovieCoverModel(
      {required this.adult,
      required this.backdrop_path,
      required this.genre_ids,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory MovieCoverModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCoverModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCoverModelToJson(this);
}
