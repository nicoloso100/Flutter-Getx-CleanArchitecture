import 'package:flutter/material.dart';
import 'package:flutter_movies/IoC/injector.dart';
import 'package:flutter_movies/app/core/utils/error_notification.dart';
import 'package:flutter_movies/app/data/DTOs/search_movie_dto.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';
import 'package:flutter_movies/app/domain/usecases/get_popular_movies.dart';
import 'package:flutter_movies/app/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_movies/app/domain/usecases/search_movie.dart';
import 'package:flutter_movies/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final getPopularMovies = Injector.resolve<GetPopularMovies>();
  final getTopRatedMovies = Injector.resolve<GetTopRatedMovies>();
  final searchMovie = Injector.resolve<SearchMovie>();

  final PagingController<int, MovieCover> pagingPopular =
      PagingController(firstPageKey: 1);
  final PagingController<int, MovieCover> pagingTopRated =
      PagingController(firstPageKey: 1);
  late TextEditingController searchController;

  static const pageSize = 20;
  final isDarkMode = Get.isDarkMode.obs;
  final prev = ''.obs;
  List<MovieCover> searchResult = [];

  BuildContext? context;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    pagingPopular.addPageRequestListener((pageKey) {
      loadPopularMovies(pageKey);
    });
    pagingTopRated.addPageRequestListener((pageKey) {
      loadTopRatedMovies(pageKey);
    });

    pagingTopRated.addPageRequestListener((pageKey) {
      loadTopRatedMovies(pageKey);
    });

    searchController.addListener(searchMovieListener);
  }

  void loadPopularMovies(int pageKey) async {
    var result = await getPopularMovies.call(params: pageKey);
    result.fold((failure) => showErrorToast(context, failure.message),
        (popularList) {
      final isLastPage = popularList.length < pageSize;
      if (isLastPage) {
        pagingPopular.appendLastPage(popularList);
      } else {
        final nextPageKey = pageKey + popularList.length;
        pagingPopular.appendPage(popularList, nextPageKey);
      }
    });
  }

  void loadTopRatedMovies(int pageKey) async {
    var result = await getTopRatedMovies.call(params: pageKey);
    result.fold((failure) => showErrorToast(context, failure.message),
        (topRatedList) {
      final isLastPage = topRatedList.length < pageSize;
      if (isLastPage) {
        pagingTopRated.appendLastPage(topRatedList);
      } else {
        final nextPageKey = pageKey + topRatedList.length;
        pagingTopRated.appendPage(topRatedList, nextPageKey);
      }
    });
  }

  void searchMovieListener() async {
    if (prev.value != searchController.text) {
      prev.value = searchController.text;
      if (prev.value.isNotEmpty) {
        var result =
            await searchMovie.call(params: SearchMovieDTO(1, prev.value));
        result.fold((failure) => showErrorToast(context, failure.message),
            (searchList) {
          searchResult = searchList;
        });
      }
    }
  }

  void onSelectMovie(int id) {
    Get.toNamed(Routes.DETAILS, arguments: id);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onChangeTheme(bool value) {
    if (value == true) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    isDarkMode.value = value;
  }
}
