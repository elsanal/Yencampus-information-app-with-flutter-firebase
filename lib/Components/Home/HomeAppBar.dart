import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/appBarImageSwiper.dart';
import 'package:yencampus/Components/SettingPopUpMenu.dart';
import 'package:yencampus/Database/PopUpList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/translation.dart';

Widget homeAppBarBackground(BuildContext context,
    Widget menuBar,final data,String title){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    height: width,
    width: width,
    decoration: BoxDecoration(
      // color: Colors.black,
        border: Border(
            bottom : BorderSide(
                color: Colors.grey.shade400,
                width: 4)
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new Container(
          width: width,
          margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(5),
            right: ScreenUtil().setWidth(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Campus+",style: titleStyle,),
              settingPopUpMenu(context)
            ],
          ),
        ),
        AppBarImageSwiper(images: data, title: title,),
        menuBar
      ],
    ),
  );
}


Widget category(String cat){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
    child: Text(cat,style: titleStyle2.copyWith(
      fontSize: ScreenUtil().setSp(70)
    ),),
  );
}




