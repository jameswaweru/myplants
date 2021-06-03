import 'package:flutter/material.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/screens/DetailPage.dart';

class PlantedTreeCard extends StatelessWidget {

  PlantedTree plantedTree = PlantedTree("plantId", "name", "description", 120, 3, "https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG", "wikipediaLink", "Mar 25, 2021");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailPage(plantedTree);
        }));
      },
      child: Card(
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
                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG"),
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
                            Text("Plant Name" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text("Plant Name",
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

