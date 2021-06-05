import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/models/tree.dart';
import 'package:my_plants/models/tree.dart';
import 'package:my_plants/models/tree.dart';
import 'package:my_plants/screens/DetailPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PlantCard extends StatelessWidget {
  //Tree plantedTree = PlantedTree("plantId", "name", "description", 120, 3, "https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG", "wikipediaLink", "Mar 25, 2021");
  Tree tree;
  PlantCard(this.tree);

  bool isPlantAdded = false;

  Future<bool> _isItPlanted(Tree selectedPlant)  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String plantedPlantsString = prefs.getString("plantedPlantsJsonString") ?? "";
    if(plantedPlantsString.isNotEmpty){
      var plantsObjsJson = jsonDecode(plantedPlantsString)as List;
      List<PlantedTree> plantedTrees= plantsObjsJson.map((plantJson) => PlantedTree.fromJson(plantJson)).toList();
      if(plantedTrees.length > 0){
        for(var i=0;i<plantedTrees.length;i++){
          if(plantedTrees[i].plantId == selectedPlant.plantId){
            isPlantAdded = true;
          }
        }
      }
    }
    print("plant is added results:"+isPlantAdded.toString());
    return isPlantAdded;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        this._isItPlanted(tree).whenComplete(() =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(tree , isPlantAdded );
            }))
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.0,
              child: Container(
                height: 120,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(tree.imageUrl),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(tree.name , textAlign: TextAlign.start,),
            SizedBox(height: 5,),
            Text("Watered after every "+tree.wateringInterval.toString()+" days" , style: TextStyle(fontSize: 10), textAlign: TextAlign.start,),
          ],
        ),
      ),
    );
  }
}

