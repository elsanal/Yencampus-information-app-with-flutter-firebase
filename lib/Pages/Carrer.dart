import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';

class Carer extends StatefulWidget {
  const Carer({Key? key}) : super(key: key);

  @override
  _CarerState createState() => _CarerState();
}

class _CarerState extends State<Carer> {

  List<String> _items = ["All","Most recent","Popular","Fully funded",
    "Partially funded","More"];
  String selected = 'all';
  String input = '';

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
              pageBody(context,selected,"carer"),
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
