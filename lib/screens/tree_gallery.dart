import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:my_plants/components/gallery_container.dart';
import 'package:my_plants/constants/utils.dart';
import 'package:my_plants/models/tree_photo.dart';

class GalleryPage extends StatefulWidget {

  String plantName;

  GalleryPage(this.plantName);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos By UnPlash" , style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: getPhotos(widget.plantName),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                    child: Center(
                        child: Text("Loading...")
                    )
                );
              }else{

                return StaggeredGridView.countBuilder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context , index) => GalleryContainer(index , snapshot.data[index]),
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(2),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                );

              }
            }
        ),
      ),
    );
  }
}
