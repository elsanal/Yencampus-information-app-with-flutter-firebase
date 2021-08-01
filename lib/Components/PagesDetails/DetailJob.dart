import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Function/convertListString.dart';
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
            header(context,translate(context, "category"), listToString(doc.category)),
            new SizedBox(height: 10,),
            doc.nb_poste!="N/A"?header(context,translate(context, "nb_poste"), doc.nb_poste):Container(),
            doc.nb_poste!="N/A"?new SizedBox(height: 10,):Container(),
            doc.salary!="N/A"?header(context,translate(context, "salary"), doc.salary):Container(),
            doc.salary!="N/A"?new SizedBox(height: 10,):Container(),
            header(context,translate(context, "country"), doc.country),
            new SizedBox(height: 10,),
            header(context,translate(context, "city"), doc.city),
            new SizedBox(height: 10,),
            doc.deadline!="N/A"?header(context,translate(context, "deadline"), doc.deadline):Container(),
            doc.deadline!="N/A"?new SizedBox(height: 10,):Container(),

            doc.email!="N/A"?header(context,translate(context, "email"), doc.email):Container(),
            doc.email!="N/A"?new SizedBox(height: 10,):Container(),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "condition")+" :"),
            header(context,translate(context, "experience"), doc.experience),
            new SizedBox(height: 10,),
            header(context,translate(context, "std_level"), listToString(doc.level)),
            new SizedBox(height: 10,),
            header(context,translate(context, "level_lang"), listToString(doc.language)),
            new SizedBox(height: 10,),

            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "Mission : ")),
            body(doc.description),
            new SizedBox(height: 20,),
            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            title2(translate(context, "req")+" :"),
            body(doc.required),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[3]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  actionButton(context,"apply",Icons.web_rounded,Colors.red,doc,"job"),
                  actionButton(context,"web",Icons.web_rounded,Colors.blue,doc,"job"),
                  isLocal?actionButton(context,"delete",Icons.save_rounded,Colors.blue,doc,"job"):
                  actionButton(context,"save",Icons.save_rounded,Colors.green,doc,"job"),
                  actionButton(context,"share",Icons.share_rounded,Colors.deepOrange,doc,"job")
                ],
              ),
            ),
            new SizedBox(height: 10,),
          ],
        )
    ),
  );
}