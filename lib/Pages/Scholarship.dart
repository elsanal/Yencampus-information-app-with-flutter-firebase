import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';


class Scholarship extends StatefulWidget {


  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {

  List<String> _items = ["All","Most recent","Popular","Fully funded",
                          "Partially funded","More"];
  List<DocumentSnapshot> enContent = [];
  List<DocumentSnapshot> frContent = [];
  int nb = 0;
  String input = '';

  getData()async{
    FirebaseFirestore.instance.collection("scholarship")
    .get()
    .then((QuerySnapshot snapshot){
      snapshot.docs.forEach((doc) {
        enContent.add(doc);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
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
            pageBody(context,enContent),
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
              print(items[index]);
              setState(() {

              });
            },
            child: pageMenuBar(items[index]),
          );
        },
      ),
    );
  }
}





