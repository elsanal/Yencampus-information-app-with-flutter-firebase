import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';


class Scholarship extends StatefulWidget {

  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {

  List<String> _items = ["All","Most recent","Popular","Fully funded",
                          "Partially funded","More"];
  var _selected = 'All';
  String _target = '';
  String _input = '';
  int _selectedIndex=0;


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
            _selected=="All"?pageBody(context,_selected,"scholar"):
            _selected=="true"?filterBody(context, 'scholar', _target, true):
            filterBody(context, 'scholar', _target, _selected),
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
                _input = value;
              });
              print(_input);
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
                _selectedIndex = index;
              });
              onSelected(items[index]);
            },
            child: pageMenuBar(items[index],index,_selectedIndex),
          );
        },
      ),
    );
  }

  onSelected(String item){
    switch(item){
      case "Most recent":
        setState(() {
          _selected = getDate();
          _target = "deadline";
        });
      break;
      case "Popular":
        setState(() {
          _selected = "true";
          _target = "isTopScholar";
        });
        break;
      case "Fully funded":
        setState(() {
          _selected = "Full funded";
          _target = "amount";
        });
        break;
      case "Partially funded":
        setState(() {
          _selected = "Partially funded";
          _target = "amount";
        });
        break;
      case "All":
        setState(() {
          _selected = "All";
        });
        break;
      case "More":
        break;
    }
  }

}





