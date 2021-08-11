import 'package:flutter/material.dart';
import 'package:yencampus/Components/PagesDetails/DetailsComp.dart';
import 'package:yencampus/Function/convertListString.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

Widget detailScholar(BuildContext context, ScholarshipGnClass doc,bool isLocal){
  var width = MediaQuery.of(context).size.width;
  String year = doc.isYear?translate(context, "year"):translate(context, "month");
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            header(context,translate(context, "country"), doc.country),
            header(context,translate(context, "level"), listToString(doc.level)),
            header(context,translate(context, "amount"), doc.amount),
            doc.isFullFunded?header(context,translate(context, "type"), translate(context, "full_funded")):
            header(context,translate(context, "type"), translate(context, "part_funded")),
            header(context,translate(context, "yearr"), doc.year),
            header(context,translate(context, "duration"), doc.duration + year),
            header(context,translate(context, "deadline"), doc.deadline),
            header(context,translate(context, "eligible"), listToString(doc.eligible)),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            body(doc.description),
            new SizedBox(height: 10,),

            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            title2(translate(context, "condition")),
            body(doc.condition),
            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            title2(translate(context, "document")),
            body(doc.req_docs),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[3]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "how_apply")),
            body(doc.how_to_apply),
            new SizedBox(height: 10,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  actionButton(context,"apply",Icons.web_rounded,Colors.red,doc,"scholar"),
                  actionButton(context,"web",Icons.web_rounded,Colors.blue,doc,"scholar"),
                  isLocal?actionButton(context,"delete",Icons.save_rounded,Colors.blue,doc,"scholar"):
                  actionButton(context,"save",Icons.save_rounded,Colors.green,doc,"scholar"),
                  actionButton(context,"share",Icons.share_rounded,Colors.deepOrange,doc,"scholar")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}

