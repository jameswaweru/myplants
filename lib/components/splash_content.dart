import 'package:flutter/material.dart';


class SplashContent extends StatelessWidget {

  final double imageHeight;
  final double imageWidth;
  final String title;
  final String description;
  final String image;

  SplashContent(this.title, this.description, this.image, this.imageHeight, this.imageWidth);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(title),
        Text(description),
        Spacer(flex: 4,),
        Image.asset(
          image,
          height: imageHeight,
          width: imageWidth
        )
      ],
    );
  }
}

