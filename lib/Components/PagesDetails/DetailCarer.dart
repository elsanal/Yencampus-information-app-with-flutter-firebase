
import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/SavedClass.dart';


Widget detailCarer(BuildContext context, CarerClass doc, bool isLocal){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [

            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            body(doc.description_fr),
            new SizedBox(height: 20,),
            title2("Advantages"),
            body(doc.advantage_fr),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            title2("Disadvantages"),
            body(doc.disadvantage_fr),
            new SizedBox(height: 20,),

            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  actionButton(context,"Apply",Icons.web_rounded,Colors.green,doc,"carer"),
                  isLocal?actionButton(context,"Delete",Icons.save_rounded,Colors.blue,doc,"carer"):
                  actionButton(context,"Save",Icons.save_rounded,Colors.blue,doc,"carer"),
                  actionButton(context,"Share",Icons.share_rounded,Colors.red,doc,"carer")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}