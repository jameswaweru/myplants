import 'package:flutter/material.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/screens/DetailPage.dart';


class PlantCard extends StatelessWidget {
  PlantedTree plantedTree = PlantedTree("plantId", "name", "description", 120, 3, "https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG", "wikipediaLink", "Mar 25, 2021");
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailPage(plantedTree);
        }));
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
                        image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/1/17/Cherry_tomatoes_red_and_green_2009_16x9.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text("Tree Name" , textAlign: TextAlign.start,),
            SizedBox(height: 5,),
            Text("Watered after 7 days" , textAlign: TextAlign.start,),
          ],
        ),
      ),
    );
  }
}

