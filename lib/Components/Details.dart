import 'package:flutter/material.dart';
import 'package:yencampus/Components/SliverAppBar.dart';
import 'package:yencampus/Components/SliverList.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String title = "Chinese Government Scholarship";
  String imgUrl = "assets/hat1.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(context,title,imgUrl),
          sliverList(context)
        ],
      ),
    );
  }
}
