import 'package:flutter/material.dart';
// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

Color greyColor = Colors.grey;
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color lightPrimaryColor = kPrimaryColor.withOpacity(0.3);

double fixPadding = 10.0;
const double kDefaultPadding = 20.0;

TextStyle whiteSmallLoginTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);


SizedBox widthSpace = SizedBox(width: 10.0);

SizedBox heightSpace = SizedBox(height: 10.0);

TextStyle splashBigTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 40.0,
  fontFamily: 'Pacifico',
);

TextStyle appBarTextStyle = TextStyle(
  fontSize: 18.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);