import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';

Future<List<CarerClass>> getCarer(String lang)async{
  List<CarerClass> data= [];

  await FirebaseFirestore.instance.collection("career")
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      CarerClass document = new CarerClass(
        id: doc['id'],
        images: doc['images'],
        /// english
        advantage: lang=="fr"?doc['advantage_french']:doc['advantage_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        disadvantage: lang=="fr"?doc['desadvantage_french']:doc['desadvantage_english'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<CarerClass>> getTargetCarer(String lang,String target, final filter)async{
  List<CarerClass> data= [];
  await FirebaseFirestore.instance.collection("career")
      .where(target, isEqualTo: filter)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      CarerClass document = new CarerClass(
        id: doc['id'],
        images: doc['images'],
        advantage: lang=="fr"?doc['advantage_french']:doc['advantage_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        disadvantage: lang=="fr"?doc['desadvantage_french']:doc['desadvantage_english'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
