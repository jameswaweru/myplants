import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_plants/components/home_page_toolbar.dart';
import 'package:my_plants/components/no_plants_found.dart';
import 'package:my_plants/components/plant_card.dart';
import 'package:my_plants/components/planted_tree.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/models/tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  List<PlantedTree> plantedTrees;

  Home(this.plantedTrees);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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



    return Scaffold(
      body: Column(
        children: [
          HomeToolBar(height),
          Expanded(
              child: widget.plantedTrees.length > 0 ? _showPlantedTrees() : NoPlantsFound(),

          ),
        ],
      )
    );
  }

  

  Widget _showPlantedTrees(){
    List<PlantedTree> plantedTrees = [];
    PlantedTree addMore = PlantedTree(0,"1", "name", "description", 120, 3, "https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG", "wikipediaLink", "Mar 25, 2021");
    Future<List<PlantedTree>> _getPlantedTrees() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String plantedTreesString = prefs.getString('plantedPlantsJsonString') ?? "";
      if(plantedTreesString.isNotEmpty){
        var plantsObjsJson = jsonDecode(plantedTreesString)as List;
        plantedTrees= plantsObjsJson.map((plantJson) => PlantedTree.fromJson(plantJson)).toList();
        plantedTrees.add(addMore);
      }
      return plantedTrees;
    }

    Future<List<Tree>> _getTrees() async {
      return trees;
    }

    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
            width: double.infinity,
            child: Container(
              //child: NoPlantsFound(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Trees" , style: TextStyle(fontSize: 13),textAlign: TextAlign.start,),
                    SizedBox(height: 10,),
                    FutureBuilder(
                        future: _getPlantedTrees(),
                        builder: (BuildContext context , AsyncSnapshot snapshot){

                          if(snapshot.data == null){
                            return Container(
                                child: Center(
                                    child: Text("Loading...")
                                )
                            );
                          }else{
                            return Container(
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context , int index){
                                    return PlantedTreeCard(snapshot.data[index]);
                                  }
                              ),
                            );
                          }
                        })
                  ],
                ),
              ),
            )
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore More"),
              SizedBox(height: 10,),
              FutureBuilder(
                  future: _getTrees(),
                  builder: (BuildContext context , AsyncSnapshot snapshot){

                    if(snapshot.data == null){
                      return Container(
                          child: Center(
                              child: Text("Loading...")
                          )
                      );
                    }else{
                      return Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context , int index){
                              return PlantCard(snapshot.data[index]);
                            }
                        ),
                      );
                    }
                  })
            ],
          ),
        )
      ],
    );
  }

}
