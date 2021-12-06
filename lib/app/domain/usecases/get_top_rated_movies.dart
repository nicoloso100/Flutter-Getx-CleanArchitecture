import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/constants/api.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';
import 'package:flutter_movies/app/core/usecase/usecase.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';
import 'package:flutter_movies/app/domain/repositories/movies_repository.dart';

class GetTopRatedMovies implements UseCase<List<MovieCover>, int> {
  final MoviesRepository repository;

  GetTopRatedMovies(this.repository);

  @override
  Future<Either<Failure, List<MovieCover>>> call({required int params}) async {
    var list = await repository.getTopRatedMovies(params);
    return list.fold((failure) => Left(failure), (modelList) {
      List<MovieCover> movies = [];
      for (var movie in modelList) {
        var poster = movie.poster_path != null
            ? '$imagesBase${movie.poster_path}'
            : defaultImage;
        var movieCover = MovieCover(movie.id, poster, movie.title ?? 'No title',
            movie.vote_average ?? 0);
        movies.add(movieCover);
      }
      return Right(movies);
    });
  }
}
