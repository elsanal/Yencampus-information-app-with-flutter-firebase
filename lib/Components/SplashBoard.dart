import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Pages/Homepage.dart';


class Wrapper extends StatelessWidget {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  saveDevToken()async{
    final devToken = await _messaging.getToken();
    final docId = DateTime.now().millisecondsSinceEpoch;
    var tokens = FirebaseFirestore.instance.collection("DevToken")
        .doc(docId.toString());
    await tokens.set({'token': devToken});
    print("Token : $devToken");
  }
  FirebaseAuth _auth = FirebaseAuth.instance;
  final result = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    String lang = getLocale(context);
    if(result == null){
      _auth.signInAnonymously();
      saveDevToken();
      print("Just logged");
      return Homepage(lang: lang,);
    }else{
      print("Logged since");
      return Homepage(lang: lang,);
    }
  }
}