import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yencampus/Models/ImageClass.dart';

Future<List<ImageClass>> getImage()async{
  List<ImageClass> data= [];
  await FirebaseFirestore.instance.collection("images")
      .orderBy('lastupdate',descending: true)
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc){
      ImageClass document = new ImageClass(
        id: doc['id'],
        images: doc['images'],
      );
      data.add(document);
      // print("University");
    });
  });
  return data;
}