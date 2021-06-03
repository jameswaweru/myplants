import 'package:flutter/material.dart';

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
                Image.asset("assets/not-found.png", height: 100,),
                Text(
                  "Your garen is Empty" ,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  ),
                ),
              ],
            )
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
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
                            "Eplore Plants" ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_sharp , color: Colors.white,)
                        ],
                      ),
                    )
                )
              ],
            )

        )









        // Image.asset("assets/dry_plant.png", height: 100,),
        // Text("Your garen is Empty"),
        // Container(
        //   height: 60,
        //   margin: EdgeInsets.all(40),
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     color: Theme.of(context).primaryColor
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 12, left: 12),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(""),
        //         Text(
        //           "Eplore Plants" ,
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 14
        //           ),
        //         ),
        //         Icon(Icons.arrow_right_alt_sharp , color: Colors.white,)
        //       ],
        //     ),
        //   )
        // )
      ],

    );
  }
}
