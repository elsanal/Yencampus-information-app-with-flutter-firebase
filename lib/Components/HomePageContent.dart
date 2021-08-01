import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';


Widget homepageContent(BuildContext context, final docs, String type){
  return docs.length>0?GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.15,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10
      ),
      itemCount: docs.length<4?docs.length:5,
      itemBuilder: (context,index){
        if(index == 4){
          return Card(
              child: Container(
                child: Icon(Icons.add_circle_outline, size: ScreenUtil().setWidth(400),),));
        }
        return Card(
          elevation: 5,
          shadowColor: Colors.grey[300],
          child: InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context)=>Details(doc: docs[index], type: type,isLocal: false,)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                height: ScreenUtil().setHeight(310),
                child: Image.network(
                "${docs[index].images[0]['src']['src']}",
                fit: BoxFit.cover,
              ),),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(docs[index].name,
                          style:titleStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(45)
                          ), maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,),
                      Text(parseHtmlString(docs[index].description),
                        style:textStyle, maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );}
  ):Container();
}

