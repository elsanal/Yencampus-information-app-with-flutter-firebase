import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Pages/Scholarship.dart';

Widget pageBody(BuildContext context, List<DocumentSnapshot> items){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: new Container(
      height:height*(items.length*0.53),
      width: width,
      padding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(50),
          top: ScreenUtil().setHeight(50)
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(60)
            ),
            child: Container(
              height: height*(2/4.15),
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(
                    height: height/3,
                    width: width,
                    alignment: Alignment.bottomCenter,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/hat$index.jpeg"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Text(" Country : China \n"
                        ' ${items[index]['deadline']} \n',
                      textAlign: TextAlign.center,
                      style: textStyle.copyWith(
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),),),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Html(data: items[index]['description_english']),
                    ),
                  ),
                  new Container(
                    width: width,
                    height: 40,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey.shade500,width: 1,style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Colors.white,width: 1,style: BorderStyle.solid),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap:()=>Navigator.push(context,
                                new MaterialPageRoute(builder: (context)=>Details(doc: items[index],))),
                            child: _actionButton("Read more")),
                        new Container(height: 40,width: 1,color: Colors.grey[400],),
                        _actionButton("Save"),
                        new Container(height: 40,width: 1,color: Colors.grey,),
                        _actionButton("Share"),
                      ],
                    ),
                  ),
                  new Container(height: 5,color: Colors.grey[500],)
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget _actionButton(String action,){
  return Text(action,style: titleStyle.copyWith(
    fontSize: ScreenUtil().setSp(50),
    color: Colors.grey[800],
  ),);
}