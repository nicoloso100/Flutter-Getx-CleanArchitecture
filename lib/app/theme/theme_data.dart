import 'package:flutter/material.dart';
import 'package:flutter_movies/app/theme/colors.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(backgroundColor: Colors.white);
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(backgroundColor: blueDark);
}
