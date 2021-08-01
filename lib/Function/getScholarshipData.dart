import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

 Future<List<ScholarshipGnClass>> getScholarship(String lang)async{
  List<ScholarshipGnClass> data= [];
  await FirebaseFirestore.instance.collection("scholarship")
      .orderBy('lastupdate',descending: true)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      ScholarshipGnClass document = new ScholarshipGnClass(
        id: doc['id'],
        amount: doc['amount'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        isTopScholar: doc['isTopScholar'],
        year: doc['year'],
        images: doc['images'],
        duration:doc['duration'],
        isOpen: doc['isOpen'],
        /// english
        advantage: lang=="fr"?doc['advantage_french']:doc['advantage_english'],
        condition: lang=="fr"?doc['condition_french']:doc['condition_english'],
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        eligible: lang=="fr"?doc['eligible_french']:doc['eligible_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        how_to_apply: lang=="fr"?doc['how_apply_french']:doc['how_apply_english'],
        level: lang=="fr"?doc['level_french']:doc['level_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        other_detail: lang=="fr"?doc['other_detail_french']:doc['other_detail_english'],
        req_docs: lang=="fr"?doc['requered_doc_french']:doc['requered_doc_english'],

      );
      data.add(document);
      // print(data);
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<ScholarshipGnClass>> getTargetScholarship(String lang,String target, final filter)async{
  List<ScholarshipGnClass> data= [];

  await FirebaseFirestore.instance.collection("scholarship")
      .orderBy('lastupdate',descending: true)
      .where(target, isEqualTo: filter)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      ScholarshipGnClass document = new ScholarshipGnClass(
          id: doc['id'],
          amount: doc['amount'],
          apply_link: doc['apply_link'],
          official_web: doc['official_web'],
          deadline: doc['deadline'],
          isTopScholar: doc['isTopScholar'],
          year: doc['year'],
          images: doc['images'],
          duration:doc['duration'],
          isOpen: doc['isOpen'],
          /// english
        advantage: lang=="fr"?doc['advantage_french']:doc['advantage_english'],
        condition: lang=="fr"?doc['condition_french']:doc['condition_english'],
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        eligible: lang=="fr"?doc['eligible_french']:doc['eligible_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        how_to_apply: lang=="fr"?doc['how_apply_french']:doc['how_apply_english'],
        level: lang=="fr"?doc['level_french']:doc['level_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        other_detail: lang=="fr"?doc['other_detail_french']:doc['other_detail_english'],
        req_docs: lang=="fr"?doc['requered_doc_french']:doc['requered_doc_english'],
      );
      data.add(document);
      print(document.isOpen);
    });
  });
  return data;
}

/// get Scholarships by arrayTargets
Future<List<ScholarshipGnClass>> getArrayTargetScholarship(String lang,String target, final filter)async{
  List<ScholarshipGnClass> data= [];
  await FirebaseFirestore.instance.collection("scholarship")
      .orderBy('lastupdate',descending: true)
      .where(target, arrayContainsAny: filter)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      ScholarshipGnClass document = new ScholarshipGnClass(
        id: doc['id'],
        amount: doc['amount'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        isTopScholar: doc['isTopScholar'],
        year: doc['year'],
        images: doc['images'],
        duration:doc['duration'],
        isOpen: doc['isOpen'],
        /// english
        advantage: lang=="fr"?doc['advantage_french']:doc['advantage_english'],
        condition: lang=="fr"?doc['condition_french']:doc['condition_english'],
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        eligible: lang=="fr"?doc['eligible_french']:doc['eligible_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        how_to_apply: lang=="fr"?doc['how_apply_french']:doc['how_apply_english'],
        level: lang=="fr"?doc['level_french']:doc['level_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        other_detail: lang=="fr"?doc['other_detail_french']:doc['other_detail_english'],
        req_docs: lang=="fr"?doc['requered_doc_french']:doc['requered_doc_english'],
      );
      data.add(document);
      print(document.isOpen);
    });
  });
  return data;
}

