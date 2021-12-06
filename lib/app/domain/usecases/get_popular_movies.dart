import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';
import 'package:flutter_movies/app/core/usecase/usecase.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';
import 'package:flutter_movies/app/domain/repositories/movies_repository.dart';

class GetPopularMovies implements UseCase<List<MovieCover>, int> {
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, List<MovieCover>>> call({required int params}) async {
    var list = await repository.getPopularMovies(params);
    return list.fold((failure) => Left(failure), (modelList) {
      List<MovieCover> movies = [];
      for (var movie in modelList) {
        var movieCover =
            MovieCover(movie.backdrop_path, movie.title, movie.vote_average);
        movies.add(movieCover);
      }
      return Right(movies);
    });
  }
}
