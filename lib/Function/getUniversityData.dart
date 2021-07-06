import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/UniversityClass.dart';

Future<List<UniversityClass>> getUniversity()async{
  List<UniversityClass> data= [];
  await FirebaseFirestore.instance.collection("university")
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      UniversityClass document = new UniversityClass(
        id: doc['id'],
        school_fee: doc['school_fee'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        isTopUniversity: doc['isTopUniversity'],
        images: doc['images'],
        /// english
        country_en: doc['country_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        major_en: doc['depart_english'],
        /// french
        country_fr: doc['country_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        major_fr: doc['depart_french'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<UniversityClass>> getTargetUniversity(String fee)async{
  List<UniversityClass> data= [];
  await FirebaseFirestore.instance.collection("university")
      .where('school_fee', isNotEqualTo: fee)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      UniversityClass document = new UniversityClass(
        id: doc['id'],
        school_fee: doc['school_fee'],
        apply_link: doc['apply_link'],
        official_web: doc['official_web'],
        deadline: doc['deadline'],
        isTopUniversity: doc['isTopUniversity'],
        images: doc['images'],
        /// english
        country_en: doc['country_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        major_en: doc['depart_english'],
        /// french
        country_fr: doc['country_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        major_fr: doc['depart_french'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
