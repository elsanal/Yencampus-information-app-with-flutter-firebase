import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';

class University extends StatefulWidget {
  const University({Key? key}) : super(key: key);

  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  List<String> _items = ["All","Most recent","Popular","Free tuition fees","More"];
  var _selected = 'All';
  String _target = '';
  String _input = '';
  int _selectedIndex=0;

  @override
  void initState() {
    // TODO: implement initState
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
              _selected=="All"?pageBody(context,_selected,"univ"):
              _selected=="true"?filterBody(context, 'univ', _target, true):
              filterBody(context, 'univ', _target, _selected),
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
          _target = "isTopUniversity";
        });
        break;
      case "Free tuition fees":
        setState(() {
          _selected = "free";
          _target = "school_fee";
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
