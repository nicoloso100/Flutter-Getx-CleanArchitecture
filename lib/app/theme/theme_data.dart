import 'package:flutter/material.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(backgroundColor: Color(0xffffffff));
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(backgroundColor: Color(0xff2c3848));
}
