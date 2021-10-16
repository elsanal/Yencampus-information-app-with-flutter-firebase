import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesDetails/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Pages/Carrer.dart';
import 'package:yencampus/Pages/Job.dart';
import 'package:yencampus/Pages/Scholarship.dart';
import 'package:yencampus/Pages/University.dart';


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
                child:Stack(
                  children: [
                    new Container(
                      height: ScreenUtil().setHeight(310),
                      child: Image.network(
                        "${docs[index].images[0]['src']['src']}",
                        fit: BoxFit.cover,
                      ),),
                    Positioned(
                      left: ScreenUtil().setHeight(0),
                      right: ScreenUtil().setHeight(0),
                      bottom: ScreenUtil().setHeight(220),
                      child: Text(docs[index].name,
                        style:titleStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(45)
                        ), maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,),
                    ),
                    Positioned(
                        bottom: ScreenUtil().setHeight(50),
                        left: ScreenUtil().setHeight(0),
                        right: ScreenUtil().setHeight(0),
                        child: Text(parseHtmlString(docs[index].description),
                          style:textStyle, maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,),
                    ),
                    Positioned(
                        top: ScreenUtil().setHeight(1),
                        bottom: ScreenUtil().setHeight(1),
                        left: ScreenUtil().setHeight(1),
                        right: ScreenUtil().setHeight(1),
                        child: InkWell(
                          onTap: ()=>_seeMore(context, type),
                          child: Container(
                           color: Colors.black.withOpacity(0.7),
                            child: Center(child: Text("+${docs.length}",
                            style: titleStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(120)
                            ),
                            )),
                    ),
                        ))
                  ],
                ),
              )
          );
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
                          ), maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,),
                      Text(parseHtmlString(docs[index].description),
                        style:textStyle, maxLines: 3,
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

_seeMore(BuildContext context,String type){
  switch(type){
    case "scholar":
      Navigator.push(context, new MaterialPageRoute(
          builder: (context)=>Scholarship()));
      break;
    case "univ":
      Navigator.push(context, new MaterialPageRoute(
          builder: (context)=>University()));
      break;
    case "job":
      Navigator.push(context, new MaterialPageRoute(
          builder: (context)=>Job()));
      break;
    case "carer":
      Navigator.push(context, new MaterialPageRoute(
          builder: (context)=>Carer()));
      break;
  }
}
