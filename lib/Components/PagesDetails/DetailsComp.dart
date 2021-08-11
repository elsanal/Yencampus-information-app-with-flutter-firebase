import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Function/urlLauncher.dart';
import 'package:yencampus/Models/SavedClass.dart';

Widget header(BuildContext context,String title, String result){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    width: MediaQuery.of(context).size.width,
    child: Wrap(
      children: [
        new Text("$title : ",style: titleStyle2.copyWith(
            fontSize: ScreenUtil().setSp(50),
          fontWeight: FontWeight.bold
        ),maxLines: 5,),
        new Text("$result",style: titleStyle2.copyWith(
            fontSize: ScreenUtil().setSp(50),
            fontWeight: FontWeight.w400
        ),maxLines: 5,),
      ],
    ),
  );
}

Widget title2(String title){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text(title,style: titleStyle2.copyWith(
      fontSize: ScreenUtil().setSp(90)
    )),
  );
}

Widget body(String body){
  return Container(
    // padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
    child: Html(data: body,style: bodyStyle,),
  );
}

Widget actionButton(BuildContext context,String title,IconData icon,
                    Color iconColor, final doc, String type){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: new ElevatedButton(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(iconColor),
          elevation: MaterialStateProperty.all(5.0),
        ),
        onPressed:(){
         switch(title){
           case "share":
             sharePost(context,doc, type);
             break;
           case "save" :
             localDB(tableName: "YENCAMPUS").saveOndB(SavePost(type: type, id: doc.id));
             final snackBar = SnackBar(
               content: Text("Saved"),);
             ScaffoldMessenger.of(context).showSnackBar(snackBar);
             break;
           case "apply" :
             if(type!="carer"){
               return UlrLauncher(context,doc.apply_link);
             }
             break;
           case "web" :
             if(type!="carer"){
               return UlrLauncher(context,doc.official_web);
             }
             break;
           case "delete":
             localDB(tableName: "YENCAMPUS").delete(int.parse(doc.id));
             final snackBar = SnackBar(
               content: Text(translate(context, "deleted")),);
             ScaffoldMessenger.of(context).showSnackBar(snackBar);
             Navigator.of(context).pop(true);
             break;
         }
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Icon(icon,color: Colors.white,),
              Text(translate(context, title),style: titleStyle.copyWith(
                fontSize: ScreenUtil().setSp(40),
                color: Colors.white,
              ),),
            ],
          ),
        )
    ),
  );
}