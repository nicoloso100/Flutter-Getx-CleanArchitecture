import 'package:flutter_movies/app/data/repositories/movies_repository.dart';
import 'package:flutter_movies/app/domain/repositories/movies_repository.dart';
import 'package:flutter_movies/app/domain/usecases/get_movie_description.dart';
import 'package:flutter_movies/app/domain/usecases/get_popular_movies.dart';
import 'package:flutter_movies/app/domain/usecases/get_top_rated_movies.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureMoviesModuleFactories();
  }

  // Movies module factories
  @Register.factory(MoviesRepository, from: MoviesRepositoryImpl)
  @Register.factory(GetMovieDescription)
  @Register.factory(GetPopularMovies)
  @Register.factory(GetTopRatedMovies)
  void _configureMoviesModuleFactories();
}
