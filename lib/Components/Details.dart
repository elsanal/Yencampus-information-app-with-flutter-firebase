
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailAppbar.dart';
import 'package:yencampus/Components/PagesDetails/DetailCarer.dart';
import 'package:yencampus/Components/PagesDetails/DetailScholar.dart';
import 'package:yencampus/Components/PagesDetails/DetailJob.dart';
import 'package:yencampus/Components/PagesDetails/DetailTip.dart';
import 'package:yencampus/Components/PagesDetails/DetailUniv.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

class Details extends StatefulWidget {
  final doc;
  String type;
  bool isLocal;
  Details({required this.doc, required this.type,required this.isLocal});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late final doc;
  late String type;
  late bool isLocal;

  @override
  void initState() {
    // TODO: implement initState
    doc = widget.doc;
    type = widget.type;
    isLocal = widget.isLocal;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
       physics: ScrollPhysics(),
        slivers: [
          type != "tip"?sliverAppBar(context,doc.name,doc.images[1]['src']['src'],false):
          sliverAppBar(context,doc[0]['title'],'',true),
          _type()
        ],
      ),
    );
  }
  _type(){
    switch(type){
      case "scholar":
        return detailScholar(context,doc,isLocal);
      case "univ":
        return detailUniv(context,doc,isLocal);
      case "job":
        return detailJob(context,doc,isLocal);
      case "carer":
        return detailCarer(context,doc,isLocal);
      case "tip":
        return detailTip(tips: doc);
      default :
        return SliverToBoxAdapter(child: Container(),);
    }
  }
}


