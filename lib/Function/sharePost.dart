import 'package:flutter_share/flutter_share.dart';


 dynamic sharePost(final post, String type)async{
  String campusapp = 'https://play.google.com/store/apps/details?id=com.bigfaso.campus';
  String _title = "Campus+, l'application qui donne des informations sur les bourses,"+
      "les universités, les Jobs et bien d'autres informations.";
  if(type=="scholar"){
      try{
        await FlutterShare.share(
          title: _title,
          text:post.name_fr + '\n\n'+
              'Pays : ' + post.country_fr + '\n\n' +
              'Niveau : ' + post.level_fr.toString() +'\n\n'+
              'Montant : ' +post.amount + "\n\n"+
              'Date limite : ' +post.deadline + "\n\n"
              + "Site web officiel : \n" + post.official_web + "\n\n"
              + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
          linkUrl: campusapp,
        );
      }catch(e){
        print('error : $e');
      }
  } else if(type=="univ"){
    try{
      await FlutterShare.share(
        title: _title,
        text:post.name_fr + '\n\n'+
            'Pays : ' + post.country_fr + '\n\n' +
            'Montant : ' +post.description_fr + "\n\n"
            + "Site web officiel : \n" + post.official_web + "\n\n"
            + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else if(type == "carer"){
    try{
      await FlutterShare.share(
        title: _title,
        text:post.name_fr + '\n\n'+
            post.description_fr + '\n\n'
            + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else if(type=="job"){
    try{
      await FlutterShare.share(
        title: _title,
        text:post.name_fr + '\n\n'+
            'Pays : ' + post.country_fr + '\n\n' +
            'Montant : ' +post.salary + "\n\n"+
            'Date limite : ' +post.deadline + "\n\n"
            + "Site web officiel : \n" + post.official_web + "\n\n"
            + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  }else {
    try{
      await FlutterShare.share(
        title: _title,
        text: "Telechargez Campus+ pour voir plus de bourses disponibles : ",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  }

}