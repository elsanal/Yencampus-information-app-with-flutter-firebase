import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/UniversityClass.dart';

Future<List<UniversityClass>> getUniversity(String lang)async{
  List<UniversityClass> data= [];
  await FirebaseFirestore.instance.collection("university")
      .orderBy('lastupdate',descending: true)
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
        city: doc['city'],
        isOpen: doc['isOpen'],
        isPublic: doc['isPublic'],
        world_ranking: doc['world_ranking'],
        national_ranking: doc['national_ranking'],
        app_fee: doc['app_fee'],
        /// english
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        major: lang=="fr"?doc['depart_french']:doc['depart_english'],

      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
/// get Scholarships by targets
Future<List<UniversityClass>> getTargetUniversity(String lang,String target, final filter)async{
  List<UniversityClass> data= [];

  await FirebaseFirestore.instance.collection("university")
      .orderBy('lastupdate',descending: true)
      .where(target, isEqualTo: filter)
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
        city: doc['city'],
        images: doc['images'],
        isOpen: doc['isOpen'],
        isPublic: doc['isPublic'],
        world_ranking: doc['world_ranking'],
        national_ranking: doc['national_ranking'],
        app_fee: doc['app_fee'],
        /// english
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['description_french']:doc['description_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        major: lang=="fr"?doc['depart_french']:doc['depart_english'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}
