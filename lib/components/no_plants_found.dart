import 'package:flutter/material.dart';
import 'package:my_plants/screens/list_all_trees.dart';

class NoPlantsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
            flex: 2,
            child: Column(
              children: [
                Spacer(),
                Image.asset("assets/not-found.png", height: 80,),
                SizedBox(height: 5,),
                Text(
                  "Your garden is Empty" ,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  ),
                ),
                SizedBox(height: 45,),
              ],
            )
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return ListTrees();
                    }));
                  },
                  child: Container(
                      height: 60,
                      margin: EdgeInsets.all(40),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),
                            Text(
                              "Explore Trees" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19
                              ),
                            ),
                            Icon(Icons.arrow_right_alt_sharp , color: Colors.white,)
                          ],
                        ),
                      )
                  ),
                )
              ],
            )

        )

      ],

    );
  }
}
