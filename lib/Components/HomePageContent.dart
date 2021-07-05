import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

Widget homepageContent(BuildContext context, List<ScholarshipGnClass> docs){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return docs.length>0?GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10
      ),
      itemCount: docs.length,
      itemBuilder: (context,index)=>Card(
        elevation: 5,
        shadowColor: Colors.grey[300],
        child: InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context)=>Details(doc: docs[index])));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(child: Image.network(
                "${docs[index].images[0]['src']['src']}",
                fit: BoxFit.fill,
              ),),
              new Container(
                margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                color: Colors.grey[400],height: 1,width: width*(3/5),),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Html(data: docs[index].description_fr,),
                ),
              ),
              // new Container(height: 3,)
            ],
          ),
        ),
      )
  ):Container();
}