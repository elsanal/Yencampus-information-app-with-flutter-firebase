import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yencampus/Function/translation.dart';

Widget homeAppBarBackground(BuildContext context,
    Widget inputField,
    Widget menuBar,String category){
  var width = MediaQuery.of(context).size.width;
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
              Icon(Icons.notifications_active_sharp,color: Colors.black87,)
            ],
          ),
        ),
        Container(
          width: width*(3/4),
          child: Row(
            children: [
              inputField,
            ],
          ),
        ),
        pageMenuBar(translate(context, category), 0, 0),
        menuBar
      ],
    ),
  );
}


Widget category(String cat){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
    child: Text(cat,style: titleStyle2,),
  );
}



