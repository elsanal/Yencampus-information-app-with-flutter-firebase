import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';

Future<List<CarerClass>> getCarer()async{
  List<CarerClass> data= [];
  await FirebaseFirestore.instance.collection("career")
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      CarerClass document = new CarerClass(
        id: doc['id'],
        images: doc['images'],
        /// english
        advantage_en: doc['advantage_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        desadvantage_en: doc['desadvantage_english'],
        /// french
        advantage_fr: doc['advantage_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        desadvantage_fr: doc['desadvantage_french'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<CarerClass>> getTargetCarer(String fee)async{
  List<CarerClass> data= [];
  await FirebaseFirestore.instance.collection("career")
      .where('school_fee', isNotEqualTo: fee)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      CarerClass document = new CarerClass(
        id: doc['id'],
        images: doc['images'],
        /// english
        advantage_en: doc['advantage_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        desadvantage_en: doc['desadvantage_english'],
        /// french
        advantage_fr: doc['advantage_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        desadvantage_fr: doc['desadvantage_french'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
