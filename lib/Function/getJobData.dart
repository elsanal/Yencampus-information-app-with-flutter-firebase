import 'package:cloud_firestore/cloud_firestore.dart';
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
          city: doc['city'],
          email: doc['email'],
          tel: doc['tel'],
          isOpen: doc['isOpen'],
          experience: doc['experience'],
          nb_poste: doc['nb_poste'],
          enterprise: doc['enterprise'],
          /// english
          ///
          language: lang=="fr"?doc['language_french']:doc['language_english'],
          contrat_type: lang=="fr"?doc['contrat_type_french']:doc['contrat_type_english'],
          category: lang=="fr"?doc['category_french']:doc['category_english'],
          level: lang=="fr"?doc['level_french']:doc['level_english'],
          country: lang=="fr"?doc['country_french']:doc['country_english'],
          description: lang=="fr"?doc['summary_french']:doc['summary_english'],
          responsibility:lang=="fr"?doc['responsibility_french']:doc['responsibility_english'],
          name: lang=="fr"?doc['name_french']:doc['name_english'],
          required: lang=="fr"?doc['requirement_french']:doc['requirement_english'],
      );
          data.add(document);
    });
  });
  return data;
}

Future<List<JobClass>> getTargetJob(String lang,String target, final filter)async{
  List<JobClass> data= [];
  await FirebaseFirestore.instance.collection("job")
      .where(target,isEqualTo: filter)
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
        city: doc['city'],
        email: doc['email'],
        tel: doc['tel'],
        isOpen: doc['isOpen'],
        experience: doc['experience'],
        nb_poste: doc['nb_poste'],
        enterprise: doc['enterprise'],
        /// english
        ///
        language: lang=="fr"?doc['language_french']:doc['language_english'],
        contrat_type: lang=="fr"?doc['contrat_type_french']:doc['contrat_type_english'],
        category: lang=="fr"?doc['category_french']:doc['category_english'],
        level: lang=="fr"?doc['level_french']:doc['level_english'],
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['summary_french']:doc['summary_english'],
        responsibility:lang=="fr"?doc['responsibility_french']:doc['responsibility_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        required: lang=="fr"?doc['requirement_french']:doc['requirement_english'],
      );
      data.add(document);
    });
  });
  return data;
}

Future<List<JobClass>> getArrayTargetJob(String lang,String target, final filter)async{
  List<JobClass> data= [];
  await FirebaseFirestore.instance.collection("job")
      .where(target,arrayContainsAny: filter)
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
        city: doc['city'],
        email: doc['email'],
        tel: doc['tel'],
        isOpen: doc['isOpen'],
        experience: doc['experience'],
        nb_poste: doc['nb_poste'],
        enterprise: doc['enterprise'],
        /// english
        ///
        language: lang=="fr"?doc['language_french']:doc['language_english'],
        contrat_type: lang=="fr"?doc['contrat_type_french']:doc['contrat_type_english'],
        category: lang=="fr"?doc['category_french']:doc['category_english'],
        level: lang=="fr"?doc['level_french']:doc['level_english'],
        country: lang=="fr"?doc['country_french']:doc['country_english'],
        description: lang=="fr"?doc['summary_french']:doc['summary_english'],
        responsibility:lang=="fr"?doc['responsibility_french']:doc['responsibility_english'],
        name: lang=="fr"?doc['name_french']:doc['name_english'],
        required: lang=="fr"?doc['requirement_french']:doc['requirement_english'],
      );
      data.add(document);
    });
  });
  return data;
}