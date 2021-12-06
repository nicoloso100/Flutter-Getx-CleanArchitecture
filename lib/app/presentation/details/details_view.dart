import 'package:flutter/material.dart';
import 'package:flutter_movies/app/core/widgets/rating_bar.dart';
import 'package:flutter_movies/app/domain/entities/movie.dart';
import 'package:flutter_movies/app/presentation/details/widgets/actor_card.dart';
import 'package:flutter_movies/app/presentation/details/widgets/details_attribute.dart';
import 'package:flutter_movies/app/theme/colors.dart';

import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      body: FutureBuilder<Movie?>(
          future: controller.movieDetails,
          builder: (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
            var movieDetails = snapshot.data;
            if (movieDetails != null) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: blueLight,
                    expandedHeight: 270,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                      color: context.theme.backgroundColor,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: movieDetails.backdrop,
                        fit: BoxFit.cover,
                      ),
                    )),
                  ),
                  SliverFillRemaining(
                    child: Container(
                      color: context.theme.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieDetails.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.launchUrl(movieDetails.link);
                                      },
                                      child: Text(
                                        "WATCH NOW",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: buttonColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    )),
                                RatingBar(rating: movieDetails.rating)
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Text(
                              movieDetails.description,
                              style: TextStyle(
                                  color: context.theme.hintColor, height: 1.5),
                            ),
                            Container(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: movieDetails.actors
                                    .map((actor) => ActorCard(
                                        image: actor.image, name: actor.name))
                                    .toList(),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            DetailsAttribute(
                              label: 'Studio',
                              text: movieDetails.studios.join(','),
                            ),
                            DetailsAttribute(
                              label: 'Genre',
                              text: movieDetails.genres.join(','),
                            ),
                            DetailsAttribute(
                              label: 'Release',
                              text: movieDetails.date,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
