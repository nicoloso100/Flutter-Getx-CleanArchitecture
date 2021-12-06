import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';
import 'package:flutter_movies/app/core/usecase/usecase.dart';
import 'package:flutter_movies/app/domain/entities/actors.dart';
import 'package:flutter_movies/app/domain/entities/movie.dart';
import 'package:flutter_movies/app/domain/repositories/movies_repository.dart';

class GetMovieDescription implements UseCase<Movie, int> {
  final MoviesRepository repository;

  GetMovieDescription(this.repository);

  @override
  Future<Either<Failure, Movie>> call({required int params}) async {
    var resultMovie = await repository.getMovieDetails(params);
    return resultMovie.fold((movieFailure) => Left(movieFailure),
        (movieDetails) async {
      var actors = await repository.getMovieDetailsActors(params);
      return actors.fold((actorsFailure) => Left(actorsFailure), (actorsList) {
        List<Actors> actors = [];
        for (var element in actorsList) {
          var actor = Actors(element.profile_path, element.name);
          actors.add(actor);
        }
        List<String> genres = [];
        for (var element in movieDetails.genres) {
          genres.add(element.name);
        }
        List<String> studios = [];
        for (var element in movieDetails.production_companies) {
          studios.add(element.name);
        }
        var movie = Movie(
            movieDetails.poster_path,
            movieDetails.homepage,
            movieDetails.overview,
            actors,
            genres,
            studios,
            movieDetails.backdrop_path,
            movieDetails.title,
            movieDetails.vote_average);
        return Right(movie);
      });
    });
  }
}
