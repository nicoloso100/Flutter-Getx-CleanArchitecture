import 'package:flutter/material.dart';
import 'package:flutter_movies/IoC/injector.dart';
import 'package:flutter_movies/app/domain/usecases/get_popular_movies.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final getPopularMovies = Injector.resolve<GetPopularMovies>();

  final isDarkMode = false.obs;
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    print("holaaa");
    loadPopularMovies();
  }

  void loadPopularMovies() async {
    var result = await getPopularMovies.call(params: 1);
    result.fold(
        (error) => print(error), (popularList) => print(popularList[0].name));
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
