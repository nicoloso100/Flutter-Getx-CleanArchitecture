import 'package:flutter_movies/app/domain/entities/actors.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';

class Movie extends MovieCover {
  final String poster;
  final String link;
  final String description;
  final List<Actors> actors;
  final List<String> genres;
  final List<String> studios;

  Movie(this.poster, this.link, this.description, this.actors, this.genres,
      this.studios, backdrop, name, rating)
      : super(backdrop, name, rating);
}
