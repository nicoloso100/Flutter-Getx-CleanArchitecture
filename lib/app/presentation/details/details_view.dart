import 'package:flutter/material.dart';
import 'package:flutter_movies/app/domain/entities/movie.dart';

import 'package:get/get.dart';

import 'details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsView'),
        centerTitle: true,
      ),
      body: FutureBuilder<Movie?>(
          future: controller.movieDetails,
          builder: (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
            var movieDetails = snapshot.data;
            if (movieDetails != null) {
              return Text(movieDetails.name);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
