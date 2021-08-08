import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/getImageData.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/ImageClass.dart';
import 'package:yencampus/Models/SavedClass.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  late Future<List<ImageClass>> _imageData;
  List<String> _items = ["all","scholar","univ","job","carer"];
  String _selected = 'all';
  String lang='';
  int _selectedIndex=-1;

  @override
  void initState() {
    // TODO: implement initState
    _imageData = getImage(lang);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    lang = getLocale(context);
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
            slivers: [
              pageAppBar(
                  appBarBackground(
                      context,_menuBar(width, _items),'saved')),
              SavedBody(context,_selected),
            ],
          )
      ),
    );
  }

  Widget _menuBar(double width, List<String> items){

    return Container(
      height: ScreenUtil().setHeight(120),
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
                _selected = items[index];
              });
            },
            child: pageMenuBar(translate(context, items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }
}

