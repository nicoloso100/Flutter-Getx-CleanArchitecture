import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'IoC/injector.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/theme_data.dart';

void main() {
  Injector.setup();
  runApp(
    GetMaterialApp(
      title: "Movies",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
    ),
  );
}
