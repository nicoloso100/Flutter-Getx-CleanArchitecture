import 'package:either_dart/either.dart';
import 'package:flutter_movies/app/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call({required P params});
}
