import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Models/SavedClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

Widget detailScholar(BuildContext context, ScholarshipGnClass doc,bool isLocal){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            header("Country", doc.country_fr),
            new SizedBox(height: 10,),
            header("Level", doc.level_fr[0].toString()),
            new SizedBox(height: 10,),
            header("Amount", doc.amount),
            new SizedBox(height: 10,),
            header("Duration", doc.duration),
            new SizedBox(height: 10,),
            header("Eligible", doc.eligible_fr[0].toString()),
            new SizedBox(height: 10,),

            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description_fr),
            new SizedBox(height: 20,),
            title2("Conditions"),
            body(doc.condition_fr),
            new SizedBox(height: 20,),
            title2("Documents"),
            body(doc.req_docs_fr),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2("How to apply ?"),
            body(doc.how_to_apply_fr),
            new SizedBox(height: 20,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  actionButton(context,"Apply",Icons.web_rounded,Colors.green,doc,"scholar"),
                  isLocal?actionButton(context,"Delete",Icons.save_rounded,Colors.blue,doc,"scholar"):
                  actionButton(context,"Save",Icons.save_rounded,Colors.blue,doc,"scholar"),
                  actionButton(context,"Share",Icons.share_rounded,Colors.red,doc,"scholar")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}

