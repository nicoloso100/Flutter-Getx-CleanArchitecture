// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureMoviesModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<MoviesRepository>((c) => MoviesRepositoryImpl())
      ..registerFactory((c) => GetMovieDescription(c<MoviesRepository>()))
      ..registerFactory((c) => GetPopularMovies(c<MoviesRepository>()))
      ..registerFactory((c) => GetTopRatedMovies(c<MoviesRepository>()))
      ..registerFactory((c) => SearchMovie(c<MoviesRepository>()));
  }
}
