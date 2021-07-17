import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Models/JobClass.dart';


Future<List<JobClass>> getJob(String lang)async{
  List<JobClass> data= [];

  await FirebaseFirestore.instance.collection("job")
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      JobClass document = new JobClass(
        id: doc['id'],
        salary: doc['salary'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        duration: doc['duration'],
        images: doc['images'],
        /// english
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        required: lang=="fr"?doc['requirement_french']:doc['requirement_english'],
      );
      data.add(document);
      print("There is a job for you");
    });
  });
  return data;
}

Future<List<JobClass>> getTargetJob(String lang,String target, final filter)async{
  List<JobClass> data= [];
  await FirebaseFirestore.instance.collection("job")
      .where(target,isGreaterThanOrEqualTo: filter)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      JobClass document = new JobClass(
        id: doc['id'],
        salary: doc['salary'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        duration: doc['duration'],
        images: doc['images'],
        /// english
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        required: lang=="fr"?doc['requirement_french']:doc['requirement_english'],

      );
      data.add(document);
      // print(doc.data());
    });
  });
  return data;
}