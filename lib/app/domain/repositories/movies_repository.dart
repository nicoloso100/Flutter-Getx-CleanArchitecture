import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';
import 'package:flutter_movies/app/data/models/actor/actor_model.dart';
import 'package:flutter_movies/app/data/models/movie/movie_model.dart';
import 'package:flutter_movies/app/data/models/movie_cover/movie_cover_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MovieCoverModel>>> getPopularMovies(int page);
  Future<Either<Failure, List<MovieCoverModel>>> getTopRatedMovies(int page);
  Future<Either<Failure, MovieModel>> getMovieDetails(int id);
  Future<Either<Failure, List<ActorModel>>> getMovieDetailsActors(int id);
}
