
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yencampus/Components/DetailAppbar.dart';
import 'package:yencampus/Components/DetailBody.dart';

class Details extends StatefulWidget {
  DocumentSnapshot doc;
  Details({required this.doc});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String title = "Chinese Government Scholarship";
  String imgUrl = "assets/hat1.jpeg";
  late DocumentSnapshot doc;
  @override
  void initState() {
    // TODO: implement initState
    doc = widget.doc;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(context,doc['name_english'],imgUrl),
          detailBody(context,doc)
        ],
      ),
    );
  }
}
