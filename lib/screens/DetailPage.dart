import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plants/components/gallery_container.dart';
import 'package:my_plants/constants/utils.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/models/tree.dart';
import 'package:my_plants/models/tree_photo.dart';
import 'package:my_plants/screens/tree_gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';


class DetailPage extends StatefulWidget {

  final Tree tree;
  bool isTreePlanted;

  DetailPage(this.tree , this.isTreePlanted);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expanded_height = 400;
  final double rounded_container_height = 50;


  @override
  Widget build(BuildContext context) {

    print("isTreePlanted:"+widget.isTreePlanted.toString());

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expanded_height,
        widget.tree,
        rounded_container_height,
      ),
    );
  }

  Widget _buildDetail() {

    return InkWell(
      onTap: (){

      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPlantsInfo(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Text(widget.tree.description,
                style: TextStyle(
                  color: Colors.black38,
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 30,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tree Images",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.6,
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return GalleryPage(widget.tree.name);
                      }));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                    ),
                  )


                ],
              ),
            ),
            SizedBox(height: 120, child: FeaturedWidget()),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     vertical: 15,
            //     horizontal: 15,
            //   ),
            //   child: Text(
            //     "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
            //         "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
            //         "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
            //         "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
            //         "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
            //         "The balearic Lsnaled,Lsnaled,The balea ",
            //     style: TextStyle(
            //       color: Colors.black38,
            //       height: 1.4,
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantsInfo() {

    // DateTime now = new DateTime.now();
    // int actualNextWateringDay = widget.tree.
    // int nextWateringDaysLeft = actualNextWateringDay -  now.day;
    // int wateringDueDays = now.day - actualNextWateringDay;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              widget.tree.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.tree.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Watered after every "+widget.tree.wateringInterval.toString()+" days",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: widget.isTreePlanted != true ? _buildPlantTreeFabIcon(widget.tree , context) : Text("Water"),
          )
          
          
        ],
      ),
    );
  }
}


Widget _buildPlantTreeFabIcon(Tree tree , context){
  List<PlantedTree> plantedTrees = [];
  Future<void> storingPlants(Tree tree) async{
    DateTime now = new DateTime.now();

    PlantedTree plantedTree = PlantedTree(now.day , tree.plantId, tree.name, tree.description,
        tree.growZoneNumber, tree.wateringInterval, tree.imageUrl, tree.wikipediaLink, tree.datePlanted);

    DateTime date = new DateTime(now.year, now.month, now.day);
    plantedTree.datePlanted = getMonthString(now.month)+" "+now.day.toString()+" , "+now.year.toString();
    plantedTree.dayLastWatered = now.day.toInt();

    print("tree details:"+jsonEncode(plantedTree));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String plantedTreesString = prefs.getString('plantedPlantsJsonString') ?? "";

    if(plantedTreesString == null || plantedTreesString.isEmpty){
      print("retrieved plants is null...");
      plantedTrees.add(plantedTree);
      await prefs.setString('plantedPlantsJsonString', jsonEncode(plantedTrees));
    }else{

      var plantsObjsJson = jsonDecode(plantedTreesString)as List;
      plantedTrees = plantsObjsJson.map((plantJson) => PlantedTree.fromJson(plantJson)).toList();
      plantedTrees.add(plantedTree);

      await prefs.setString('plantedPlantsJsonString', jsonEncode(plantedTrees));

      print("retrieved plants is not null..."+jsonEncode(plantedTrees));
    }
    final snackBar = SnackBar(
      content: Text('Yay! You have planted '+tree.name+' tree. You will water it in '+tree.wateringInterval.toString()+' days'),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return Column(
    children: [
      FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () => {
          storingPlants(tree).whenComplete(() =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Home(plantedTrees),
                ),
              )
          )
        },
        child: new Icon(Icons.add , color: Colors.black,),
      ),
      SizedBox(height: 3,),
      Text("Plant")
    ],
  );
}

class FeaturedWidget extends StatelessWidget {
  List<Photo> _list = Photo.generateTreePhotos();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 120,
          margin: EdgeInsets.only(
            right: 15,
          ),
          child: Image.network(
            _list[index].url,
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  // final TravelBean bean;
  final Tree plantedTree;
  final double rounded_container_height;

  DetailSliverDelegate(
      this.expandedHeight, this.plantedTree, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: plantedTree.imageUrl,
            child: Image.network(
              plantedTree.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  plantedTree.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  plantedTree.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}