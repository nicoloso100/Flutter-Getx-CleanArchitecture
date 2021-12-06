import 'package:flutter_movies/IoC/injector.dart';
import 'package:flutter_movies/app/domain/entities/movie.dart';
import 'package:flutter_movies/app/domain/usecases/get_movie_description.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final getMovieDescription = Injector.resolve<GetMovieDescription>();
  late Future<Movie?> movieDetails;

  @override
  void onInit() {
    super.onInit();

    movieDetails = loadDescription();
  }

  Future<Movie?> loadDescription() async {
    int id = Get.arguments;
    Movie? details;
    var result = await getMovieDescription.call(params: id);
    result.fold(
        (failure) => print(failure), (description) => details = description);
    return details;
  }
}
