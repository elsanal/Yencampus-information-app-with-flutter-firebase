import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Function/urlLauncher.dart';

MoreApps(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  String lang = getLocale(context);
  String url = 'https://play.google.com/store/apps/details?id=com.yentech.yenpuz';
  Alert(
    title: translate(context, "more_apps"),
    context: context,
    style: AlertStyle(
      backgroundColor: Colors.grey[300],
      titleStyle: titleStyle2.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(80)
      ),
    ),
    buttons: [
      DialogButton(
          color: Colors.red.withOpacity(0.3),
          child: Text("Okay",style: titleStyle2,),
          onPressed: (){
            Navigator.of(context).pop(true);
          }),
    ],
    content: Container(
        height: height*(1.5/5),
        width: width,
        child: ListView(
          children: [
            Container(
              color: Colors.grey[100],
              child: InkWell(
                onTap: ()=>UlrLauncher(context, url),
                child: new Row(
                  children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Container(
                            height: ScreenUtil().setHeight(250),
                            width: ScreenUtil().setWidth(250),
                            child: Image.asset("assets/yenpuz.png"),),
                          new Text("YenPuz",style: titleStyle.copyWith(
                            fontSize: ScreenUtil().setSp(60),
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Expanded(
                        child: new Container(
                          child: Text(lang=="fr"?_moreApp['fr']![0]:_moreApp['en']![0],
                            style: textStyle,
                          ),),
                  )
                ],),
              ),
            )
          ],
        )
    ),
  )..show();
}

var _moreApp = {
  "fr":["YenPuz est une application de jeu très interessante. "
      "C'est un jeu de puzzle qui vous permet de vous exercer "
      "sur vos capacités en logique.\n"
      "Cliquez pour la Télécharger sur Google Play."],
  "en":["YenPuz is a very interesting game application."
      "It's a puzzle game that you can use to practice"
      " your logic skills.\n Click to download it on Google Play."]
};