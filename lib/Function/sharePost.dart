import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:yencampus/Models/SharePostClass.dart';

 dynamic sharePost(SharePost post)async{
  String campusapp = 'https://play.google.com/store/apps/details?id=com.bigfaso.campus';
  try{
    await FlutterShare.share(
      title: "Campus+, l'application qui donne des informations sur les bourses,"
          "les universités, les Jobs et bien d'autres informations.",
      text:post.name + '\n\n'+
          'Pays : ' + post.country + '\n\n' +
          'Niveau : ' + post.level.toString() +'\n\n'+
          'Montant : ' +post.amount + "\n\n"+
          'Date limite : ' +post.deadline + "\n\n"
          + "Site web officiel : \n" + post.file + "\n\n"
          + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
      linkUrl: campusapp,
    );
  }catch(e){
    print('error : $e');
  }
}