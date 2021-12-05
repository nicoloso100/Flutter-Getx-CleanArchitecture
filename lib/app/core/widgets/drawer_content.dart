import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class DrawerContent extends StatelessWidget {
  final HomeController controller;

  const DrawerContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwitchListTile(
        title: const Text('Dark mode'),
        value: controller.isDarkMode.value,
        onChanged: controller.onChangeTheme,
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
