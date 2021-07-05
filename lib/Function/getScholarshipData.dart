import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

 Future<List<ScholarshipGnClass>> getScholarship()async{
  List<ScholarshipGnClass> data= [];
  await FirebaseFirestore.instance.collection("scholarship")
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
        /// english
        advantage_en: doc['advantage_english'],
        condition_en: doc['condition_english'],
        country_en: doc['country_english'],
        eligible_en: doc['eligible_english'],
        description_en: doc['description_english'],
        how_to_apply_en: doc['how_apply_english'],
        level_en: doc['level_english'],
        name_en: doc['name_english'],
        other_detail_en: doc['other_detail_english'],
        req_docs_en: doc['requered_doc_english'],
        /// french
        advantage_fr: doc['advantage_french'],
        condition_fr: doc['condition_french'],
        country_fr: doc['country_french'],
        eligible_fr: doc['eligible_french'],
        description_fr: doc['description_french'],
        how_to_apply_fr: doc['how_apply_french'],
        level_fr: doc['level_french'],
        name_fr: doc['name_french'],
        other_detail_fr: doc['other_detail_french'],
        req_docs_fr: doc['requered_doc_french']
      );
      data.add(document);
      // print(data);
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<ScholarshipGnClass>> getTargetScholarship(final date)async{
  List<ScholarshipGnClass> data= [];
  await FirebaseFirestore.instance.collection("scholarship")
      .where('deadline', isGreaterThanOrEqualTo: date)
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
          /// english
          advantage_en: doc['advantage_english'],
          condition_en: doc['condition_english'],
          country_en: doc['country_english'],
          eligible_en: doc['eligible_english'],
          description_en: doc['description_english'],
          how_to_apply_en: doc['how_apply_english'],
          level_en: doc['level_english'],
          name_en: doc['name_english'],
          other_detail_en: doc['other_detail_english'],
          req_docs_en: doc['requered_doc_english'],
          /// french
          advantage_fr: doc['advantage_french'],
          condition_fr: doc['condition_french'],
          country_fr: doc['country_french'],
          eligible_fr: doc['eligible_french'],
          description_fr: doc['description_french'],
          how_to_apply_fr: doc['how_apply_french'],
          level_fr: doc['level_french'],
          name_fr: doc['name_french'],
          other_detail_fr: doc['other_detail_french'],
          req_docs_fr: doc['requered_doc_french']
      );
      data.add(document);
      // print(data);
    });
  });
  return data;
}

