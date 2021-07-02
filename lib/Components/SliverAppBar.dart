import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget sliverAppBar(BuildContext context){
  return SliverAppBar(
    title: Text("YenCampus+"),
    centerTitle: true,
    floating: false,
    pinned: true,
    snap: false,
    excludeHeaderSemantics: true,
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.brown,
    shadowColor: Colors.black87,
    expandedHeight: ScreenUtil().setHeight(200),
    flexibleSpace: FlexibleSpaceBar(
      background: FittedBox(
        fit: BoxFit.fill,
        child: Card(color: Colors.deepPurple,),
      ),
    ),
    actions: [
      new Text("Home",style: TextStyle(color: Colors.red),),
      new Text("School",style: TextStyle(color: Colors.red)),
      new Text("University",style: TextStyle(color: Colors.red))
    ],
  );
}