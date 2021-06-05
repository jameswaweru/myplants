import 'package:flutter/material.dart';
import 'package:my_plants/components/plant_card.dart';
import 'package:my_plants/models/tree.dart';

class ListTrees extends StatefulWidget {
  @override
  _ListTreesState createState() => _ListTreesState();
}

class _ListTreesState extends State<ListTrees> {

  Future<List<Tree>> _getAllTrees() async {
    return trees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Trees" , style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: FutureBuilder(
            future: _getAllTrees(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                    child: Center(
                        child: Text("Loading...")
                    )
                );
              }else{
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return PlantCard(snapshot.data[index]);
                    }
                );
              }
            }
        ),
      )
      
      
    );
  }
}
