import 'package:flutter_movies/app/data/models/actor/actor_model.dart';
import 'package:flutter_movies/app/data/models/movie_cover/movie_cover_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_list_model.g.dart';

@JsonSerializable()
class MoviesListModel {
  final int page;
  final List<MovieCoverModel> results;
  final int total_pages;
  final int total_results;

  MoviesListModel(
      {required this.page,
      required this.results,
      required this.total_pages,
      required this.total_results});

  factory MoviesListModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListModelToJson(this);
}
