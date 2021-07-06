import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';


class Scholarship extends StatefulWidget {

  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {

  List<String> _items = ["All","Most recent","Popular","Fully funded",
                          "Partially funded","More"];
  List<ScholarshipGnClass> docs = [];
  String selected = 'all';
  String input = '';

  @override
  void initState() {
    // TODO: implement initState
    // _initData();
    print("Scholarship");
    super.initState();
  }
  _initData()async{
    docs = await getScholarship();
    print(docs[0].level_en);
  }
  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: new CustomScrollView(
          slivers: [
           pageAppBar(
               appBarBackground(
                   context,_formField(width),_menuBar(width, _items))),
            pageBody(context,selected,"scholar"),
          ],
        )
      ),
    );
  }

  Widget _formField(double width){
    return Expanded(
      child: Container(
        height:ScreenUtil().setHeight(100),
        child: new TextFormField(
            maxLines: 1,
            decoration: formFieldDeco,
            onChanged: (value){
              setState(() {
                input = value;
              });
              print(input);
            },
        ),
      ),
    );
  }
  Widget _menuBar(double width, List<String> items){
    return Container(
      height: ScreenUtil().setHeight(90),
      width: width,
      padding: EdgeInsets.only(
          left: 5,
          right: 5
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              setState(() {
                selected = items[index];
              });
            },
            child: pageMenuBar(items[index]),
          );
        },
      ),
    );
  }
}





