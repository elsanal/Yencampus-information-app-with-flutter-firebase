import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Pages/Scholarship.dart';

Widget appBar(BuildContext context,Widget page, List<String> items){
  var width = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        // color: Colors.black,
        border: Border(
            bottom : BorderSide(
                color: Colors.grey.shade400,
                width: 4)
        )
    ),
    child: Stack(
      children: [
        new Positioned(
            top: ScreenUtil().setHeight(0),
            right: ScreenUtil().setHeight(00),
            left: ScreenUtil().setHeight(00),
            child: Container(
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
            )
        ),
        new Positioned(
          top: ScreenUtil().setHeight(120),
            child: Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new  InkWell(
                    onTap: (){Navigator.push(context, new MaterialPageRoute(
                          builder: (context)=>page));},
                    child: Icon(Icons.home_rounded,size: 40,),
                  ),
                  new Container(
                    width: width*(2/3),
                    height: ScreenUtil().setHeight(100),
                    child: new TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(0),
                          bottom: ScreenUtil().setHeight(0),
                          left: ScreenUtil().setHeight(10),
                          right: ScreenUtil().setHeight(10),
                        ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(40))
                              ),
                              borderSide: BorderSide(color: Colors.black87,width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenUtil().setWidth(40))
                              ),
                              borderSide: BorderSide(color: Colors.pink,width: 2.0)
                          ),
                        // suffix: Text("Search"),
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search"
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
        new Positioned(
          bottom: ScreenUtil().setHeight(10),
            child: Container(
              height: ScreenUtil().setHeight(90),
              width: width,
              padding: EdgeInsets.only(
                left: 5,
                right: 5
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context)=>page));
                    },
                    child: menuBarItem(items[index]),
                  );
                },
              ),
            )
        )
      ],
    ),
  );
}

Widget menuBarItem(String item){
  return new Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
    decoration: BoxDecoration(
      color: Colors.grey[200],
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

Widget category(String cat){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
    child: Text(cat,style: titleStyle2,),
  );
}

