import 'package:flutter/material.dart';
import 'package:my_plants/models/tree_photo.dart';

class MoreImages extends StatelessWidget {

  List<Photo> _list;
  MoreImages(this._list);

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
