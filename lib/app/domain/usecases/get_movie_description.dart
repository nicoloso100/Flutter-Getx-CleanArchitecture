import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/constants/api.dart';
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
          var actor = Actors(element.profile_path, element.name ?? 'No name');
          actors.add(actor);
        }
        List<String> genres = [];
        var genresList = movieDetails.genres;
        if (genresList != null) {
          for (var element in genresList) {
            genres.add(element.name);
          }
        }
        List<String> studios = [];
        var studiosList = movieDetails.production_companies;
        if (studiosList != null) {
          for (var element in studiosList) {
            studios.add(element.name ?? 'No name');
          }
        }

        var poster = movieDetails.poster_path != null
            ? '$imagesBase${movieDetails.poster_path}'
            : defaultImage;

        var backdrop = movieDetails.backdrop_path != null
            ? '$imagesBase${movieDetails.backdrop_path}'
            : defaultImage;

        var movie = Movie(
            poster,
            movieDetails.homepage ?? '',
            movieDetails.overview ?? '',
            actors,
            genres,
            studios,
            movieDetails.id,
            backdrop,
            movieDetails.title ?? 'No title',
            movieDetails.vote_average ?? 0);
        return Right(movie);
      });
    });
  }
}
