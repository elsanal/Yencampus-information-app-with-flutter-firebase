import 'package:flutter/material.dart';
import 'package:yencampus/Components/PagesDetails/DetailsComp.dart';
import 'package:yencampus/Function/convertListString.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/UniversityClass.dart';


Widget detailUniv(BuildContext context, UniversityClass doc, bool isLocal){
  var width = MediaQuery.of(context).size.width;
  String type = '';
  String open = '';
  doc.isOpen?open=translate(context, "isOpen"):open=translate(context, "isClose");
  doc.isPublic?type=translate(context, "public"):type=translate(context, "private");
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            header(context,translate(context, "country"), doc.country),
            header(context,translate(context, "City"), doc.city),
            header(context,translate(context, "national_rank"), doc.national_ranking.toString()),
            header(context,translate(context, "world_rank"), doc.world_ranking.toString()),
            header(context,translate(context, "type"), type),
            header(context,translate(context, "school_fee"), doc.school_fee),
            header(context,translate(context, "app_fee"), doc.app_fee),
            header(context,translate(context, "state"), open),
            doc.isOpen?Container():header(context,translate(context, "deadline"), doc.deadline),
            new SizedBox(height: 10,),


            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "depart_majors")+" :"),
            embListToString(context,doc.major),
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
                  actionButton(context,"apply",Icons.web_rounded,Colors.red,doc,"univ"),
                  actionButton(context,"web",Icons.web_rounded,Colors.blue,doc,"univ"),
                  isLocal?actionButton(context,"delete",Icons.save_rounded,Colors.blue,doc,"univ"):
                  actionButton(context,"save",Icons.save_rounded,Colors.green,doc,"univ"),
                  actionButton(context,"share",Icons.share_rounded,Colors.deepOrange,doc,"univ")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}