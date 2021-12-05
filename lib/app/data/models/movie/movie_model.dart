import 'package:flutter_movies/app/data/models/collection/collection_model.dart';
import 'package:flutter_movies/app/data/models/genre/genre_model.dart';
import 'package:flutter_movies/app/data/models/production_company/production_company_model.dart';
import 'package:flutter_movies/app/data/models/production_country/production_country_model.dart';
import 'package:flutter_movies/app/data/models/spoken_language/spoken_language_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final bool adult;
  final String backdrop_path;
  final CollectionModel belongs_to_collection;
  final double budget;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final String imdb_id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<ProductionCompanyModel> production_companies;
  final List<ProductionCountryModel> production_countries;
  final DateTime release_date;
  final double revenue;
  final int runtime;
  final List<SpokenLanguageModel> spoken_languages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double vote_average;
  final double vote_count;

  MovieModel(
      {required this.adult,
      required this.backdrop_path,
      required this.belongs_to_collection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdb_id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.production_companies,
      required this.production_countries,
      required this.release_date,
      required this.revenue,
      required this.runtime,
      required this.spoken_languages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
