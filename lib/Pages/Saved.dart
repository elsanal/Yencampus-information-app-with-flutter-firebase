import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Components/SavedBody.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  List<String> _items = ["all","scholar","univ","job","majors"];
  String _selected = 'all';
  String lang='';
  int _selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    lang = getLocale(context);
    Admob().myInterstitialAd();
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: width,
            height: height,
            child: new CustomScrollView(
              slivers: [
                pageAppBar(
                    appBarBackground(
                        context,_menuBar(width, _items),'saved')),
                savedBody(context,_selected),
              ],
            ),
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
              if(items[index] == 'majors'){
                setState(() {
                  _selectedIndex = index;
                  _selected = "carer";
                });
              }else{
                setState(() {
                  _selectedIndex = index;
                  _selected = items[index];
                });
              }
            },
            child: pageMenuBar(translate(context, items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }
}

