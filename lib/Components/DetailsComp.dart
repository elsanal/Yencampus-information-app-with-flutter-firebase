import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';




save(int value){
  print("save");
}

Widget header(String title, String result){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text("$title : $result",style: titleStyle2.copyWith(
        fontSize: ScreenUtil().setSp(50)
    ),),
  );
}

Widget title2(String title){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text(title,style: titleStyle2),
  );
}

Widget body(String body){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: Text(parseHtmlString(body),style: textStyle,textAlign: TextAlign.justify,),
  );
}

Widget actionButton(String title,IconData icon, Color iconColor, final doc){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: new ElevatedButton(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(iconColor),
          elevation: MaterialStateProperty.all(5.0),
        ),
        onPressed:(){
          // sharePost(
          //     SharePost(
          //       name: doc.name_fr,
          //       country: doc.country_fr,
          //       level: doc.level_fr,
          //       amount : doc.amount,
          //       duration : doc.duration,
          //       deadline: doc.deadline,
          //       file: doc.apply_link,
          //     )
          // );
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Icon(icon,color: Colors.white,),
              Text(title,style: titleStyle.copyWith(
                fontSize: ScreenUtil().setSp(50),
                color: Colors.white,
              ),),
            ],
          ),
        )
    ),
  );
}