import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/constants/api.dart';
import 'package:flutter_movies/app/data/models/actor/actor_model.dart';
import 'package:flutter_movies/app/data/models/cast/cast_model.dart';
import 'package:flutter_movies/app/data/models/movie_cover/movie_cover_model.dart';
import 'package:flutter_movies/app/data/models/movie/movie_model.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';
import 'package:flutter_movies/app/data/models/movies_list/movies_list_model.dart';
import 'package:flutter_movies/app/domain/repositories/movies_repository.dart';
import 'package:http/http.dart' as http;

class MoviesRepositoryImpl implements MoviesRepository {
  static const internetFailure = Failure(
      "An error occurred sending the petition, please check your internet connection.");

  @override
  Future<Either<Failure, MovieModel>> getMovieDetails(int id) async {
    try {
      final response = await http.get(Uri.parse('$apiBase$getDetails$id'),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      if (response.statusCode == 200) {
        var movie = MovieModel.fromJson(jsonDecode(response.body));
        return Right(movie);
      } else {
        var failure = Failure(
            "An error occurred while getting the movie's details, please try again.");
        return Left(failure);
      }
    } catch (e) {
      return Left(internetFailure);
    }
  }

  @override
  Future<Either<Failure, List<ActorModel>>> getMovieDetailsActors(
      int id) async {
    try {
      final response = await http.get(
          Uri.parse('$apiBase$getDetails$id/credits'),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      if (response.statusCode == 200) {
        var actors = CastModel.fromJson(jsonDecode(response.body));
        return Right(actors.cast ?? []);
      } else {
        var failure = Failure(
            "An error occurred while getting the movie's credits, please try again.");
        return Left(failure);
      }
    } catch (e) {
      return Left(internetFailure);
    }
  }

  @override
  Future<Either<Failure, List<MovieCoverModel>>> getPopularMovies(
      int page) async {
    try {
      final response = await http.get(
          Uri.parse('$apiBase$getPopular?page=$page'),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      if (response.statusCode == 200) {
        var list = MoviesListModel.fromJson(jsonDecode(response.body));
        return Right(list.results);
      } else {
        var failure = Failure(
            "An error occurred while getting popular movies, please try again.");
        return Left(failure);
      }
    } catch (e) {
      return Left(internetFailure);
    }
  }

  @override
  Future<Either<Failure, List<MovieCoverModel>>> getTopRatedMovies(
      int page) async {
    try {
      final response = await http.get(
          Uri.parse('$apiBase$getTopRated?page=$page'),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      if (response.statusCode == 200) {
        var list = MoviesListModel.fromJson(jsonDecode(response.body));
        return Right(list.results);
      } else {
        var failure = Failure(
            "An error occurred while getting top rated movies, please try again.");
        return Left(failure);
      }
    } catch (e) {
      return Left(internetFailure);
    }
  }

  @override
  Future<Either<Failure, List<MovieCoverModel>>> searchMovies(
      String text, int page) async {
    try {
      final response = await http.get(
          Uri.parse('$apiBase$searchMovie?query=$text&page=$page'),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      if (response.statusCode == 200) {
        var list = MoviesListModel.fromJson(jsonDecode(response.body));
        return Right(list.results);
      } else {
        var failure = Failure(
            "An error occurred while searching the movie, please try again.");
        return Left(failure);
      }
    } catch (e) {
      return Left(internetFailure);
    }
  }
}
