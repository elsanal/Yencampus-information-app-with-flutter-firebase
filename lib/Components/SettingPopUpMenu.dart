

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Setting/About.dart';
import 'package:yencampus/Components/Setting/Contact.dart';
import 'package:yencampus/Components/Setting/MoreApp.dart';
import 'package:yencampus/Components/Setting/YenTech.dart';
import 'package:yencampus/Database/PopUpList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Function/translation.dart';

settingPopUpMenu(BuildContext context){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
    margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil().setWidth(40))
        )
    ),
    child: PopupMenuButton(
      color: Colors.grey[100],
      child:Icon(Icons.menu_rounded,color: Colors.black87,),
      itemBuilder: (_context) => settingPopUpList
          .map<PopupMenuItem>((element) => PopupMenuItem(
        child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(3),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(element['icon'],size:ScreenUtil().setWidth(60),color: Colors.black,),
                new SizedBox(width: ScreenUtil().setWidth(20),),
                Text(translate(context,element['name']),
                  style: titleStyle2,
                ),
              ],
            )
        ),
           value: element['value'],
      ),
      ).toList(),
      onSelected: (result){
        int index = int.parse(result.toString());
        String item = settingPopUpList[index]['name'];
        switch(item){
          case "contact":
            return Contact(context);
          case "about":
            return About(context);
          case "more_apps":
            return MoreApps(context);
          case "share":
            return sharePost(context, null, 'app');
          case "yentech":
            return YenTech(context);
        }
      },
    ),
  );
}