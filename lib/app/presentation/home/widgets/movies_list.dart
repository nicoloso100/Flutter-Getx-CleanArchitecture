import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class MoviesList extends StatelessWidget {
  final Widget popularList;
  final Widget topRated;

  const MoviesList(
      {Key? key, required this.popularList, required this.topRated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 75,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: context.theme.backgroundColor),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "POPULAR",
                      style: TextStyle(fontSize: 13),
                    ),
                    Container(
                      height: 20,
                    ),
                    popularList
                  ],
                ),
                Container(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOP RATED",
                      style: TextStyle(fontSize: 13),
                    ),
                    Container(
                      height: 20,
                    ),
                    topRated
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
