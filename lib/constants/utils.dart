import 'dart:convert';
import 'dart:io';
import 'package:my_plants/models/planted_tree.dart';
import 'package:my_plants/models/tree_photo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String getMonthString(int month){
  String monthString = month == 1 ? "Jan"
      : month == 2 ? "Feb"
      : month == 3 ? "March"
      : month == 4 ? "April"
      : month == 5 ? "May"
      : month == 6 ? "June"
      : month == 7 ? "July"
      : month == 8 ? "Aug"
      : month == 9 ? "Sept"
      : month == 10 ? "Oct"
      : month == 11 ? "Nov"
      : month == 12 ? "Dec"
      : "Invalid";
  return monthString;
}

String wateringString(int lastWatered, int wateringInterval){
  DateTime now = new DateTime.now();
  int actualNextWateringDay = lastWatered + wateringInterval;
  int nextWateringDaysLeft = actualNextWateringDay -  now.day;
  int wateringDueDays = now.day - actualNextWateringDay;
  String wateringText = nextWateringDaysLeft < 0 ? "Watering due with "+wateringDueDays.toString()+" days" :
  nextWateringDaysLeft == 0 ? "Water today" : "Water in "+nextWateringDaysLeft.toString()+" days";
  return wateringText;
}

bool isWateringDue (int lastWatered, int wateringInterval){
  DateTime now = new DateTime.now();
  int actualNextWateringDay = lastWatered + wateringInterval;
  int nextWateringDaysLeft = actualNextWateringDay -  now.day;
  int wateringDueDays = now.day - actualNextWateringDay;
  if(nextWateringDaysLeft < 0){
    return true;
  }
  return false;
}

int wateringDueDays(int lastWatered, int wateringInterval){
  DateTime now = new DateTime.now();
  int actualNextWateringDay = lastWatered + wateringInterval;
  int nextWateringDaysLeft = actualNextWateringDay -  now.day;
  int wateringDueDays = now.day - actualNextWateringDay;
  return nextWateringDaysLeft;
}

Future<List<PlantedTree>> getPlantedTreesThatMissedWatering() async{
  List<PlantedTree> plantedTreesThatMissedWatering = [];
  List<PlantedTree> plantedTrees = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String plantedTreesString = prefs.getString('plantedPlantsJsonString') ?? "";
  if(plantedTreesString.isNotEmpty){
    var plantsObjsJson = jsonDecode(plantedTreesString)as List;
    plantedTrees= plantsObjsJson.map((plantJson) => PlantedTree.fromJson(plantJson)).toList();

    for (var r in plantedTrees){

      DateTime now = new DateTime.now();
      int actualNextWateringDay = r.dayLastWatered + r.wateringInterval;
      int nextWateringDaysLeft = actualNextWateringDay -  now.day;
      int wateringDueDays = now.day - actualNextWateringDay;
      if(nextWateringDaysLeft < 0){
        //r.notification = "Watering due with "+wateringDueDays.toString()+" days";
        plantedTreesThatMissedWatering.add(r);
      }
    }
    return plantedTreesThatMissedWatering;
  }


  return plantedTreesThatMissedWatering;
}


Future<List<Photo>> getPhotos(String plantName) async {
  List<Photo> photos = [];

  var queryParameters = {
    'client_id': 'cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils',
    'per_page': '30',
    'orientation':'portrait',
    'page':'1',
    'query':plantName,
  };
  var uri =
  Uri.https('api.unsplash.com', '/search/photos', queryParameters);

  var response = await http.get(uri, headers: {
    // HttpHeaders.authorizationHeader: 'Token $token',
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  var jsonData = jsonDecode(response.body);

  var results = jsonData['results'];

  for (var r in results){

    Photo photo = Photo(r["urls"]["small"], r["user"]["first_name"] , r["user"]["links"]["html"]);
    photos.add(photo);
  }

  print("apiResponse length:"+photos.length.toString());
  return photos;
}