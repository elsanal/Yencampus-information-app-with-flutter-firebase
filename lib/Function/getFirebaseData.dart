import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

getScholarship(){
  List<DocumentSnapshot> enContent = [];
  List<DocumentSnapshot> frContent = [];
  FirebaseFirestore.instance.collection("scholarship")
      .get()
      .then((QuerySnapshot snapshot){
    snapshot.docs.forEach((doc) {
      print(doc['amount']);
      enContent.add(doc);
    });
  });
}

