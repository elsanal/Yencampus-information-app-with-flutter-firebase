import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/SharePostClass.dart';

import 'ShareArticle.dart';

Widget detailBody(BuildContext context, ScholarshipGnClass doc){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _header("Country", doc.country_fr),
            new SizedBox(height: 10,),
            _header("Level", doc.level_fr[0].toString()),
            new SizedBox(height: 10,),
            _header("Amount", doc.amount),
            new SizedBox(height: 10,),
            _header("Duration", doc.duration),
            new SizedBox(height: 10,),
            _header("Eligible", doc.eligible_fr[0].toString()),
            new SizedBox(height: 10,),

            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            _body(doc.description_fr),
            new SizedBox(height: 20,),
            _title2("Conditions"),
            _body(doc.condition_fr),
            new SizedBox(height: 20,),
            _title2("Documents"),
            _body(doc.req_docs_fr),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            _title2("How to apply ?"),
            _body(doc.how_to_apply_fr),
            new SizedBox(height: 20,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton("Apply",Icons.web_rounded,Colors.green,doc),
                  _actionButton("Save",Icons.save_rounded,Colors.blue,doc),
                  _actionButton("Share",Icons.share_rounded,Colors.red,doc)
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}

 save(int value){
  print("save");
}
Widget _header(String title, String result){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text("$title : $result",style: titleStyle2.copyWith(
        fontSize: ScreenUtil().setSp(50)
    ),),
  );
}

Widget _title2(String title){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text(title,style: titleStyle2),
  );
}

Widget _body(String body){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: Html(data: body,style: bodyStyle),
  );
}

Widget _actionButton(String title,IconData icon,
    Color iconColor,ScholarshipGnClass doc){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: new ElevatedButton(
        style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(iconColor),
            elevation: MaterialStateProperty.all(5.0),
        ),
        onPressed:(){
          sharePost(
              SharePost(
                  name: doc.name_fr,
                  country: doc.country_fr,
                  level: doc.level_fr,
                  amount : doc.amount,
                  duration : doc.duration,
                  deadline: doc.deadline,
                  file: doc.apply_link,
              )
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Icon(icon,color: Colors.white,),
              Text(title,style: titleStyle.copyWith(
                fontSize: ScreenUtil().setSp(50),
                color: Colors.white,
              ),),
            ],
          ),
        )
    ),
  );
}