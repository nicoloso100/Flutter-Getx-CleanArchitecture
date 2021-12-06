import 'package:flutter/cupertino.dart';
import 'package:flutter_movies/IoC/injector.dart';
import 'package:flutter_movies/app/core/utils/error_notification.dart';
import 'package:flutter_movies/app/domain/entities/movie.dart';
import 'package:flutter_movies/app/domain/usecases/get_movie_description.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';

class DetailsController extends GetxController {
  final getMovieDescription = Injector.resolve<GetMovieDescription>();
  late Future<Movie?> movieDetails;
  BuildContext? context;

  @override
  void onInit() {
    super.onInit();

    movieDetails = loadDescription();
  }

  Future<Movie?> loadDescription() async {
    int id = Get.arguments;
    Movie? details;
    var result = await getMovieDescription.call(params: id);
    result.fold((failure) => showErrorToast(context, failure.message),
        (description) => details = description);
    return details;
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showErrorToast(context, "This movie has not external url");
    }
  }
}
