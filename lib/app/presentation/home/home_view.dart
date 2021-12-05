import 'package:flutter/material.dart';
import 'package:flutter_movies/app/core/assets/constants.dart';
import 'package:flutter_movies/app/core/widgets/drawer_content.dart';
import 'package:flutter_movies/app/presentation/home/widgets/header.dart';
import 'package:flutter_movies/app/presentation/home/widgets/movies_list.dart';
import 'package:flutter_movies/app/theme/colors.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  Widget getPopularList() {
    return Container(
      height: 200,
      color: Colors.red,
    );
  }

  Widget getTopRated() {
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blueLight,
        appBar: AppBar(
          backgroundColor: blueLight,
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: Image.asset(logoAsset)),
              ListBody(
                children: [DrawerContent(controller: controller)],
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Header(controller: controller),
            MoviesList(
              popularList: getPopularList(),
              topRated: getTopRated(),
            )
          ],
        ));
  }
}
