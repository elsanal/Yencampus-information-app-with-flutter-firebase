import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Decoration/Fonts.dart';

Widget sliverAppBar(BuildContext context,String title, String imgUrl, bool isTip){
  return SliverAppBar(
    floating: true,
    pinned: false,
    snap: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    expandedHeight: ScreenUtil().setHeight(700),
    excludeHeaderSemantics: true,
    // collapsedHeight: ScreenUtil().setHeight(200),
    leading: Container(),
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      collapseMode: CollapseMode.parallax,
      title: Text(title,style: titleStyle.copyWith(
        backgroundColor: Colors.white.withOpacity(0.5),
        fontSize: isTip?ScreenUtil().setSp(40):ScreenUtil().setSp(80),
      ),textAlign: TextAlign.center,),
      background: FittedBox(
        fit: BoxFit.contain,
        child: !isTip?Image.network(imgUrl):Image.asset('assets/menuSwiper/hat1.jpeg'),
      ),
    ),
  );
}