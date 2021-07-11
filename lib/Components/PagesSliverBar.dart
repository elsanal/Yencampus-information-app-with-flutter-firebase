import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Pages/Homepage.dart';


Widget pageAppBar(Widget background,){
  return SliverAppBar(
    floating: true,
    pinned: false,
    snap: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    expandedHeight: ScreenUtil().setHeight(400),
    // collapsedHeight:ScreenUtil().setHeight(300),
    excludeHeaderSemantics: true,
    leading: Container(),
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      collapseMode: CollapseMode.parallax,
      background: background
    ),
  );
}

Widget appBarBackground(BuildContext context,
    Widget inputField,
    Widget menuBar){
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
          width: width,
          child: searchBarWithHome(context,inputField),
        ),
        menuBar
      ],
    ),
  );
}

Widget searchBarWithHome(BuildContext context,Widget formField){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      new SizedBox(width: 10,),
      new  InkWell(
        onTap: (){Navigator.of(context).pop(true);},
        child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.home_rounded,size: 40,color: Colors.black87,)),
      ),
      new SizedBox(width: 10,),
      formField,
      CircleAvatar(radius: 20,backgroundColor: Colors.white,)
    ],
  );
}

Widget pageMenuBar(String item, int index, int selectedIndex){
  return new Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
    margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
    decoration: BoxDecoration(
        color: index == selectedIndex?Colors.blue:Colors.grey[200],
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil().setWidth(40))
        )
    ),
    child: FittedBox(
      fit: BoxFit.contain,
      child: Center(
        child: Text(item,style: titleStyle.copyWith(
            fontSize: ScreenUtil().setSp(80),
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    ),
  );
}

