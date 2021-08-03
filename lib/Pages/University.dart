import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/Countries.dart';
import 'package:yencampus/Database/PopUpList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/getImageData.dart';
import 'package:yencampus/Function/menuItemSelection.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/ImageClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';

class University extends StatefulWidget {

  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  List<String> _items = ["all",'isOpenn',"privatee","publicc","country","majors"];
  var _selected = '';
  String _target = '';
  int _selectedIndex=0;
  String lang='';
  bool isArrayTarget = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    lang = getLocale(context);
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
            slivers: [
              pageAppBar(
                  appBarBackground(
                      context,_menuBar(width, _items),'univ')),
              _selected==""?pageBody(context,"univ"):
              _selected=="true"?filterBody(context, 'univ', _target, true,false):
              _selected=="false"?filterBody(context, 'univ', _target, false,false):
              filterBody(context, 'univ', _target, _selected,isArrayTarget),
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
              List result = [];
              setState(() {
                _selectedIndex = index;
              });
              if(items[index]!="country"){
                result = switchItem(items[index]);
                setState(() {
                  _selected = result[0];
                  _target = result[1];
                });
              }else{
                lang=="fr"?selectCountry(context, countries['fr']):
                selectCountry(context, countries['en']);
              }
              print(result);
            },
            child: pageMenuBar(translate(context, items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }


  selectCountry(BuildContext context,var items){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Alert(
      title: translate(context, "select"),
      context: context,
      style: AlertStyle(
        backgroundColor: Colors.grey[100],
        titleStyle: titleStyle2,
      ),
      buttons: [
        DialogButton(
            color: Colors.red.withOpacity(0.3),
            child: Text(translate(context, "cancel"),style: titleStyle2,),
            onPressed: (){
              Navigator.of(context).pop(true);
            }),
      ],
      content: Container(
        height: ScreenUtil().setHeight(height),
        width: width,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                child: ListTile(
                  onTap: (){
                    setState(() {
                      _selected = items[index];
                      _target = lang=="fr"?"country_french":"country_english";
                    });
                    print(_selected);
                    Navigator.of(context).pop(true);
                  },
                  title: Text("${items[index]}",style: textStyle,),
                ),
              );
            }
        ),
      ),
    )..show();
  }

}
