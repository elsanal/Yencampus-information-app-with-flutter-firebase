import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Models/UniversityClass.dart';

import '../ShareArticle.dart';

Widget detailUniv(BuildContext context, UniversityClass doc){
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
            header("Level", doc.major_fr[0].toString()),
            new SizedBox(height: 10,),
            header("School fee", doc.school_fee),
            new SizedBox(height: 10,),
            header("Deadline", doc.deadline),
            new SizedBox(height: 10,),


            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description_fr),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),


            new Container(
              width: width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  actionButton("Apply",Icons.web_rounded,Colors.green,doc),
                  actionButton("Save",Icons.save_rounded,Colors.blue,doc),
                  actionButton("Share",Icons.share_rounded,Colors.red,doc)
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}