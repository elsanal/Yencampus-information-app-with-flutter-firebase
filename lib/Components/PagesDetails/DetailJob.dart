import 'package:flutter/material.dart';
import 'package:yencampus/Components/PagesDetails/DetailsComp.dart';
import 'package:yencampus/Function/convertListString.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/JobClass.dart';

Widget detailJob(BuildContext context, JobClass doc,bool isLocal){
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            header(context,translate(context, "enterprise"), doc.enterprise),
            header(context,translate(context, "domain"), listToString(doc.category)),
            doc.nb_poste!="N/A"?header(context,translate(context, "nb_poste"), doc.nb_poste):Container(),
            doc.salary!="N/A"?header(context,translate(context, "salary"), doc.salary):Container(),
            header(context,translate(context, "experience"), doc.experience + " "+translate(context, "year")),
            header(context,translate(context, "std_level"), listToString(doc.level)),
            header(context,translate(context, "level_lang"), listToString(doc.language)),
            header(context,translate(context, "country"), doc.country),
            header(context,translate(context, "city"), doc.city),
            doc.deadline!="N/A"?header(context,translate(context, "deadline"), doc.deadline):Container(),
            doc.email!="N/A"?header(context,translate(context, "email"), doc.email):Container(),
            

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "enterprise_summary")+" :"),
            body(doc.description),
            new SizedBox(height: 20,),
            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "responsibility")+" :"),
            body(doc.responsibility),
            new SizedBox(height: 20,),
            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2(translate(context, "qualification")+" :"),
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