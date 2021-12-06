import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/presentation/home/home_controller.dart';
import 'package:flutter_movies/app/presentation/home/widgets/movie_card.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchMoviesList extends StatelessWidget {
  final HomeController controller;

  const SearchMoviesList({Key? key, required this.controller})
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
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              children: controller.searchResult
                  .map((movie) => Container(
                        key: UniqueKey(),
                        child: InkWell(
                          onTap: () => controller.onSelectMovie(movie.id),
                          child: MovieCard(
                              image: movie.backdrop,
                              name: movie.name,
                              rating: movie.rating),
                        ),
                      ))
                  .toList()),
        ));
  }
}
