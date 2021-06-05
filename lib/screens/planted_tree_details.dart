import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plants/components/more_images.dart';
import 'package:my_plants/constants/constants.dart';
import 'package:my_plants/constants/utils.dart';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/models/tree_photo.dart';
import 'package:my_plants/screens/tree_gallery.dart';

class PlantedTreeDetails extends StatefulWidget {

  PlantedTree plantedTree;

  PlantedTreeDetails(this.plantedTree);

  @override
  _PlantedTreeDetailsState createState() => _PlantedTreeDetailsState();
}

class _PlantedTreeDetailsState extends State<PlantedTreeDetails> {

  final double expanded_height = 400;
  final double rounded_container_height = 50;


  @override
  Widget build(BuildContext context) {
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
        widget.plantedTree,
        rounded_container_height,
      ),
    );
  }

  Widget _buildDetail() {

    return InkWell(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return GalleryPage("Apple");
        // }));

        // Navigator.push(
        //     context,
        //     PageTransition(
        //         duration: Duration(milliseconds: 700),
        //         type: PageTransitionType.fade,
        //         child: GalleryPage("")))
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
              child: Text(widget.plantedTree.description,
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
                    "More Images",
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
                        return GalleryPage(widget.plantedTree.name);
                      }));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 120,
                child: FutureBuilder(
                    future: getPhotos(widget.plantedTree.name),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(
                            child: Center(
                                child: Text("Loading images...")
                            )
                        );
                      }else{
                        return MoreImages(snapshot.data);
                      }
                    }
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantsInfo() {

    DateTime now = new DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              widget.plantedTree.imageUrl,
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
                  widget.plantedTree.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  wateringString(widget.plantedTree.dayLastWatered, widget.plantedTree.wateringInterval),
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
            child: isWateringDue(widget.plantedTree.dayLastWatered, widget.plantedTree.wateringInterval) == true ? buildWateringIcon(widget.plantedTree, context) : buildDisabledIcon(widget.plantedTree,context),
          ),
        ],
      ),
    );
  }
}

Widget buildDisabledIcon(PlantedTree tree, context){
  return InkWell(
    onTap: (){
      final snackBar = SnackBar(
        content: Text('Not today! You will water it in '+wateringDueDays(tree.dayLastWatered, tree.wateringInterval).toString()+' days'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(image: AssetImage("assets/water"), height: 30,width: 30,),
          Text("Water", style: TextStyle(color: Colors.white),)
        ],
      ),
    ),
  );
}


Widget buildWateringIcon (PlantedTree tree, context){
  return InkWell(
    onTap: (){
      final snackBar = SnackBar(
        content: Text('Yay! Your tree has been watered, you will water it next after '+tree.wateringInterval.toString()+' days'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Row(
        children: [
          // Image(image: AssetImage("assets/water"), height: 30,width: 30,),
          Text("Water")
        ],
      ),
    ),
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
  final PlantedTree plantedTree;
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




