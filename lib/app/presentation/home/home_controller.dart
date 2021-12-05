import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isDarkMode = false.obs;

  void onChangeTheme(bool value) {
    if (value == true) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    isDarkMode.value = value;
  }
}
