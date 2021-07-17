import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Function/convertListString.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/UniversityClass.dart';


Widget detailUniv(BuildContext context, UniversityClass doc, bool isLocal){
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
            header(translate(context, "school_fee"), doc.school_fee),
            new SizedBox(height: 10,),
            header(translate(context, "deadline"), doc.deadline),
            new SizedBox(height: 10,),


            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "depart_majors")),
            embListToString(doc.major),
            new SizedBox(height: 20,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Wrap(

                children: [
                  actionButton(context,"apply",Icons.web_rounded,Colors.green,doc,"univ"),
                  actionButton(context,"save",Icons.save_rounded,Colors.blue,doc,"univ"),
                  actionButton(context,"share",Icons.share_rounded,Colors.red,doc,"univ")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}