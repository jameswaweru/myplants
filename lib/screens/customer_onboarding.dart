import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plants/components/splash_content.dart';
import 'package:my_plants/constants/constants.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/utils/size_config.dart';
import 'package:my_plants/models/onboarding_content.dart';
import 'package:my_plants/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int currentIndex = 0;
  late PageController _controller;
  List<PlantedTree> plantedTrees = [];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  _loginCustomer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('isNewUser', "No").whenComplete(() =>
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(plantedTrees),
          ),
        )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientations = MediaQuery.of(context).orientation;

    // Get the proportionate height as per screen size
    double getProportionateScreenHeight(double inputHeight) {
      double screenHeight = height;
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight;
    }

    // Get the proportionate height as per screen size
    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = width;
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }


    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: getProportionateScreenHeight(250),
                          ),
                          Text(
                            contents[i].title,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => buildDot(index, context),
                  ),
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(40),
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                      currentIndex == contents.length - 1 ? "Continue" : "Next"),
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      _loginCustomer();
                    }else{
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );

  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }



  

}


