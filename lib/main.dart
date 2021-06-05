import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plants/screens/home.dart';
import 'package:my_plants/screens/launch_screen.dart';
import 'package:my_plants/screens/notifications.dart';

import 'constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Plants',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LaunchScreen(),
      // home: Notifications(),
    );
  }
}

