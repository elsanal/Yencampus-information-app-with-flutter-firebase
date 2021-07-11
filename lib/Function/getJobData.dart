import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/JobClass.dart';


Future<List<JobClass>> getJob()async{
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
        country_en: doc['country_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        required_en: doc['requirement_english'],
        /// french
        country_fr: doc['country_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        required_fr: doc['requirement_french'],
      );
      data.add(document);
      print("There is a job for you");
    });
  });
  return data;
}

Future<List<JobClass>> getTargetJob(String target, final filter)async{
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
        country_en: doc['country_english'],
        description_en: doc['description_english'],
        name_en: doc['name_english'],
        required_en: doc['requirement_english'],
        /// french
        country_fr: doc['country_french'],
        description_fr: doc['description_french'],
        name_fr: doc['name_french'],
        required_fr: doc['requirement_french'],
      );
      data.add(document);
      // print(doc.data());
    });
  });
  return data;
}