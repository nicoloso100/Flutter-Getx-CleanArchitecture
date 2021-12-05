import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/core/widgets/input.dart';
import 'package:flutter_movies/app/theme/colors.dart';

import '../home_controller.dart';

class Header extends StatelessWidget {
  final HomeController controller;

  const Header({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 25,
      child: Container(
        color: blueLight,
        child: Padding(
          padding: EdgeInsets.only(right: 50, left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hello, what do you want to watch?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  height: 1.3,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 2,
                ),
              ),
              Container(height: 15),
              CustomInput(controller: controller.searchController)
            ],
          ),
        ),
      ),
    );
  }
}
