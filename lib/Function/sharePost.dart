import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/convertListString.dart';
import 'package:yencampus/Function/translation.dart';

 dynamic sharePost(BuildContext context,final post, String type)async{
  String campusapp = 'https://play.google.com/store/apps/details?id=com.bigfaso.campus';

  String _title_fr = "Campus+, l'application qui donne des informations sur les bourses,"+
      "les universités, les Jobs et bien d'autres informations sur le plan national et "
          " international. Je trouve cette application très utile, et je vous la conseille.\n"
          "Téléchargez : $campusapp";

  String _title_en = "Campus +, the application that provides information on scholarships, " +
      "universities, jobs and much more information nationally and "
          "international. I find this application very useful, and I recommend it to you.\n"
          "Download : $campusapp";


  String _title = '';

  String lang = getLocale(context);
  lang=="fr"?_title=_title_fr:_title = _title_en;

  if(type=="scholar"){
      try{
        await FlutterShare.share(
          title: _title,
          text: _title+'\n\n'+
              post.name + '\n\n'+
              translate(context, "country")+' : ' + post.country + '\n\n' +
              translate(context, "level")+' : ' + listToString(post.level) +'\n\n'+
              translate(context, "amount")+' : ' +post.amount + "\n\n"+
              translate(context, "deadline")+' : ' +post.deadline + "\n\n"+
              translate(context, "web") + " : \n" + post.official_web + "\n\n"+
              parseHtmlString(post.description),
          linkUrl: campusapp,
        );
      }catch(e){
        print('error : $e');
      }
  } else if(type=="univ"){
    String univ_type = translate(context, "public");
    post.isPublic==true? univ_type= translate(context, "public"):translate(context, "private");
    try{
      await FlutterShare.share(
        title: _title,
        text: _title+'\n\n'+
            post.name + '\n'+
            translate(context, "country")+' : ' + post.country + '\n' +
            translate(context, "city")+' : ' +post.city + "\n" +
            translate(context, "type")+' : '+univ_type+"\n" +
            translate(context, "school_fee") + " : "+ post.school_fee +"\n" +
            translate(context, "deadline")+' : ' +post.deadline + "\n"+
            translate(context, "web")+' : '+post.official_web + "\n\n"+
            parseHtmlString(post.description)+ "\n\n",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else if(type == "carer"){
    try{
      await FlutterShare.share(
        title: _title,
        text: _title+'\n\n'+
            post.name + '\n'+
            parseHtmlString(post.description) + '\n\n',
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else if(type=="job"){
    try{
      await FlutterShare.share(
        title: _title,
        text: _title+'\n\n'+
            post.name + '\n'+
            translate(context, "country")+' : ' + post.country + '\n' +
            translate(context, "city")+' : ' + post.city + '\n' +
            translate(context, "salary")+' : ' +post.salary + "\n"+
            translate(context, "type_contact")+' : ' +post.contrat_type + "\n"+
            translate(context, "email")+' : ' +post.email + "\n"+
            translate(context, "tel")+' : ' +post.tel + "\n"+
            translate(context, "deadline")+' : ' +post.deadline + "\n"+
            translate(context, "web")+' : ' + post.official_web + "\n",
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else if(type=="app"){
    try{
      await FlutterShare.share(
        title: _title,
        text: _title,
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  } else {
    try{
      await FlutterShare.share(
        title: _title,
        text: _title,
        linkUrl: campusapp,
      );
    }catch(e){
      print('error : $e');
    }
  }
}