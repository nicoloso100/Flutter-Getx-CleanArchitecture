import 'package:flutter/cupertino.dart';
import 'package:flutter_movies/app/core/constants/api.dart';
import 'package:flutter_movies/app/core/widgets/rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String name;
  final double rating;

  const MovieCard(
      {Key? key, required this.image, required this.name, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Center(child: CircularProgressIndicator()),
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: image,
                      width: 150,
                      height: 190,
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    )),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 40,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          RatingBar(rating: rating)
        ],
      ),
    );
  }
}
