import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/ImageClass.dart';

Future<List<ImageClass>> getImage(String lang)async{
  List<ImageClass> data= [];
  await FirebaseFirestore.instance.collection("images")
      .orderBy('lastupdate',descending: true)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      ImageClass document = new ImageClass(
        id: doc['id'],
        image: doc['src']['src'],
        url: doc['url'],
        title: lang=="fr"?doc["name_french"]:doc["name_english"]
      );
      data.add(document);
    });
  });
  return data;
}