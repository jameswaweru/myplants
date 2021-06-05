import 'package:flutter/material.dart';
import 'package:my_plants/constants/constants.dart';
import 'package:my_plants/screens/notifications.dart';

class HomeToolBar extends StatelessWidget {

  final double height;

  HomeToolBar(this.height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.2 ,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16 , left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 46,),
                    Text(
                      'My Plants',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 20.0,
                          fontFamily: 'Pacifico'
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Manage your garden with MyPlants',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Notifications();
                    }));
                  },
                  child: Stack(
                    children: [
                      Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/notification.png"),
                                  fit: BoxFit.contain
                              ),
                              borderRadius: BorderRadius.circular(100)
                          )
                      ),
                      Positioned(
                          right: 5,
                          top: 0,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)
                            ),
                          )
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
