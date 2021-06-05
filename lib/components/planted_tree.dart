import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/screens/DetailPage.dart';
import 'package:my_plants/screens/list_all_trees.dart';
import 'package:my_plants/screens/planted_tree_details.dart';

class PlantedTreeCard extends StatelessWidget {

  PlantedTree plantedTree;

  PlantedTreeCard(this.plantedTree);


  @override
  Widget build(BuildContext context) {

    print("fetched plantedTree details dayLastWatered:"+plantedTree.dayLastWatered.toString());

    DateTime now = new DateTime.now();
    int actualNextWateringDay = plantedTree.dayLastWatered + plantedTree.wateringInterval;
    int nextWateringDaysLeft = actualNextWateringDay -  now.day;
    int wateringDueDays = now.day - actualNextWateringDay;
    String wateringText = nextWateringDaysLeft < 0 ? "Watering due with "+wateringDueDays.toString()+" days" :
    nextWateringDaysLeft == 0 ? "Water today" : "Water in "+nextWateringDaysLeft.toString()+" days";

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          if(plantedTree.plantId == "1"){
            return ListTrees();
          }else{
            return PlantedTreeDetails(plantedTree);
          }
        }));
      },
      child: plantedTree.plantId == "1"?
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        child: Stack(
          children: [
          Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/hand-planting.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
          child: Container(

            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 13, left: 13, top: 15, bottom: 15
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Plant More Trees" ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text("Explore trees",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),),
                    ],
                  ),
                  Icon(Icons.arrow_right_alt_sharp , color: Colors.white,)
                ],
              ),
            ),
          )
        )
          ],
        ),
      ) :
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(plantedTree.imageUrl),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Container(

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 13, left: 13, top: 15, bottom: 15
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(plantedTree.name ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(wateringText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                              ),),
                          ],
                        ),
                        Icon(Icons.arrow_right_alt_sharp , color: Colors.white,)
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

