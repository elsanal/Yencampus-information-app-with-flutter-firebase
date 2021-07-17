import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/SavedClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/SharePostClass.dart';


Widget detailJob(BuildContext context, JobClass doc,bool isLocal){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            header(translate(context, "country"), doc.country),
            new SizedBox(height: 10,),
            header(translate(context, "salary"), doc.salary),
            new SizedBox(height: 10,),
            header(translate(context, "duration"), doc.duration),
            new SizedBox(height: 10,),


            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description),
            new SizedBox(height: 20,),
            title2(translate(context, "req")),
            body(doc.required),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),


            new Container(
              width: width,
              color: Colors.grey,
              child: Wrap(
                children: [
                  actionButton(context,"apply",Icons.web_rounded,Colors.green,doc,"job"),
                  isLocal?actionButton(context,"delete",Icons.save_rounded,Colors.blue,doc,"job"):
                  actionButton(context,"save",Icons.save_rounded,Colors.blue,doc,"job"),
                  actionButton(context,"share",Icons.share_rounded,Colors.red,doc,"job")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}