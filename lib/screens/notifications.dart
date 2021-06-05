import 'package:flutter/material.dart';
import 'package:my_plants/constants/utils.dart';
import 'package:my_plants/screens/planted_tree_details.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications" , style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getPlantedTreesThatMissedWatering(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                  return noNotificationsWidget(height);
              } else {

                if(snapshot.data.length == 0){
                  return noNotificationsWidget(height);
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data[index].imageUrl
                            ),
                          ),
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(wateringString(snapshot.data[index].dayLastWatered, snapshot.data[index].wateringInterval)),
                          onTap: (){

                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => PlantedTreeDetails(snapshot.data[index]))
                            );

                          },
                        );
                      }
                  );
                }


              }

              }
          )

      )
    );
  }

  Widget noNotificationsWidget(double height){
    return Container(
      height: height,
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/okay-icon.png",),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10,),
              Text("No notifications", style: TextStyle(fontWeight: FontWeight.w500),),
              Text("All your trees are watered")
            ],
          )
      ),
    );
  }
  
}
