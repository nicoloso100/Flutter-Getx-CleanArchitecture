import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/domain/entities/movie_cover.dart';
import 'package:flutter_movies/app/presentation/home/home_controller.dart';
import 'package:flutter_movies/app/presentation/home/widgets/movie_card.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviesList extends StatelessWidget {
  final HomeController controller;

  const MoviesList({Key? key, required this.controller}) : super(key: key);

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
                    Container(
                      height: 300,
                      child: PagedListView<int, MovieCover>(
                        scrollDirection: Axis.horizontal,
                        pagingController: controller.pagingPopular,
                        builderDelegate: PagedChildBuilderDelegate<MovieCover>(
                            itemBuilder: (context, item, index) => InkWell(
                                  onTap: () =>
                                      controller.onSelectMovie(item.id),
                                  child: MovieCard(
                                    image: item.backdrop,
                                    name: item.name,
                                    rating: item.rating,
                                  ),
                                )),
                      ),
                    )
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
                    Container(
                      height: 300,
                      child: PagedListView<int, MovieCover>(
                        scrollDirection: Axis.horizontal,
                        pagingController: controller.pagingTopRated,
                        builderDelegate: PagedChildBuilderDelegate<MovieCover>(
                          itemBuilder: (context, item, index) => InkWell(
                            onTap: () => controller.onSelectMovie(item.id),
                            child: MovieCard(
                                image: item.backdrop,
                                name: item.name,
                                rating: item.rating),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
