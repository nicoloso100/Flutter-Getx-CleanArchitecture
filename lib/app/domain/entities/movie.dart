import 'package:flutter_movies/app/domain/entities/actors.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';

class Movie extends MovieCover {
  final String poster;
  final String link;
  final String description;
  final String date;
  final List<Actors> actors;
  final List<String> genres;
  final List<String> studios;

  Movie(
      this.poster,
      this.link,
      this.description,
      this.date,
      this.actors,
      this.genres,
      this.studios,
      int id,
      String backdrop,
      String name,
      double rating)
      : super(id, backdrop, name, rating);
}
