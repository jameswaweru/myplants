import 'dart:async';
import 'dart:convert';
import 'dart:core';


import 'package:flutter/material.dart';
import 'package:my_plants/constants/constants.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/screens/customer_onboarding.dart';
import 'package:my_plants/screens/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  late SharedPreferences preferences;
  List<PlantedTree> plantedTrees = [];
  late String plantedTreesString;
  late String isNewUser;

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
  }

  _checkIfIsNewCustomer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNewUser = prefs.getString('isNewUser') ?? "Yes";
    plantedTreesString = prefs.getString('plantedPlantsJsonString') ?? "";
    if(isNewUser == "Yes"){
      print("is new user");

      Timer(
          Duration(seconds: 3),
              () => Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 600),
                  type: PageTransitionType.fade,
                  child: OnBoarding())));

    }else{
      print("not new user");
      if(plantedTreesString.isNotEmpty){
        var plantsObjsJson = jsonDecode(plantedTreesString)as List;
        plantedTrees= plantsObjsJson.map((plantJson) => PlantedTree.fromJson(plantJson)).toList();
      }
      this._openHomePage();
    }
  }


  _openHomePage(){
    Timer(
        Duration(seconds: 3),
            () => Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 600),
                type: PageTransitionType.fade,
                child: Home(plantedTrees))));
  }




  @override
  Widget build(BuildContext context) {

    this._checkIfIsNewCustomer();

    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/launch_background.jpg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3], //, 0.5, 0.7, 0.9
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.55),
                    // Colors.black.withOpacity(0.7),
                    // Colors.black.withOpacity(0.8),
                    // Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My Plants',
                        style: splashBigTextStyle,
                      ),
                      heightSpace,
                      Text(
                        'Manage your garden with MyPlants',
                        style: whiteSmallLoginTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
