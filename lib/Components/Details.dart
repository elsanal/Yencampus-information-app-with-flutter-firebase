
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailAppbar.dart';
import 'package:yencampus/Components/PagesDetails/DetailCarer.dart';
import 'package:yencampus/Components/PagesDetails/DetailScholar.dart';
import 'package:yencampus/Components/PagesDetails/DetailJob.dart';
import 'package:yencampus/Components/PagesDetails/DetailUniv.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';

class Details extends StatefulWidget {
  final doc;
  String type;
  Details({required this.doc, required this.type});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late final doc;
  late String type;
  @override
  void initState() {
    // TODO: implement initState
    doc = widget.doc;
    type = widget.type;
    print("Detail");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(context,doc.name_fr,doc.images[1]['src']['src']),
          _type()
        ],
      ),
    );
  }
  _type(){
    switch(type){
      case "scholar":
        return detailScholar(context,doc);
      case "univ":
        return detailUniv(context,doc);
      case "job":
        return detailJob(context,doc);
      case "carer":
        return detailCarer(context,doc);
      default :
        return SliverToBoxAdapter(child: Container(),);
    }
  }
}


