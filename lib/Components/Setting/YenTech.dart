import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';


YenTech(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  String lang = getLocale(context);
  Alert(
    title: translate(context, "yentech"),
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
        height: height*(1/5),
        width: width,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: InkWell(
            onTap: (){},
            child: new Container(
              padding: EdgeInsets.all(8),
              child: Text(lang=="fr"?_yentech['fr']![0]:_yentech['en']![0],
                style: textStyle,
              ),),
          ),
        )
    ),
  )..show();
}

var _yentech = {
  "fr":["YenTech est une Start-Up du monde digital. Elle conçoit des "
      "applications android, iOS et des sites web. Elle se veut être pionnière "
      "de la nouvelle technologie tels que les systemes intelligents,"
      "la cybersecurité, les systemes ambarqués..."
      "Elle a l'ambition de conquerir le marché africain, et le reste "
      "du monde."],
  "en":["YenTech is a Start-Up in the digital world. It designs "
      "android, iOS applications and websites. It wants to be a pioneer "
      "new technology such as intelligent systems, "
      "cyber-security, embedded systems... "
      "It has the ambition to conquer the African market, and the rest "
      "of the world."]
};