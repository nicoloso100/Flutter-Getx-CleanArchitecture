import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String image;
  final String name;

  const ActorCard({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Center(child: CircularProgressIndicator()),
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: image,
                      width: 50,
                      height: 50,
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
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
