import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Components/Alert/ShowSelectionList.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/Countries.dart';
import 'package:yencampus/Database/PopUpList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Function/menuItemSelection.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/UniversityClass.dart';

class Job extends StatefulWidget {
  const Job({Key? key}) : super(key: key);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  List<String> _items = ["all","most_recent","salary","country","more"];
  var _selected = '';
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
                      context,_formField(width),_menuBar(width, _items),'job')),
              _selected==""?pageBody(context,_selected,"job"):
              filterBody(context, 'job', _target, true),
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
              List result = [];
              setState(() {
                _selectedIndex = index;
              });
              if(items[index]!="more"){
                result = switchItem(items[index]);
                setState(() {
                  _selected = result[0];
                  _target = result[1];
                });
              }
              print(result);
            },
            child: items[index]=="more"?popUpMenuItems(context):
            pageMenuBar(translate(context,items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }

  popUpMenuItems(BuildContext _context){
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
              Radius.circular(ScreenUtil().setWidth(40))
          )
      ),
      child: PopupMenuButton(
        child: Text(translate(context,"more"),style: titleStyle.copyWith(
            fontSize: ScreenUtil().setSp(40),
            fontWeight: FontWeight.bold
        ),),
        itemBuilder: (_context) => jobPopUpList
            .map<PopupMenuItem>((element) => PopupMenuItem(
             child: Text(translate(context, element['name'])),
          value: element['value'],
        ))
            .toList(),
        onSelected: (result){
          var value = (result.toString());
          var index = int.parse(value);
          if(jobPopUpList[index]['name']=="country"){
            selectCountry(context, countryList);
          }else{
            List result = [];
            result = switchItem(jobPopUpList[index]['name']);
            setState(() {
              _selected = result[0];
              _target = result[1];
            });
          }
        },
      ),
    );
  }

  selectCountry(BuildContext context,List items){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Alert(
      title: translate(context, "select"),
      context: context,
      style: AlertStyle(
        backgroundColor: Colors.white,
        titleStyle: titleStyle2,
      ),
      buttons: [
        DialogButton(
            color: Colors.white.withOpacity(0.3),
            child: Text(translate(context, "cancel"),style: titleStyle2,),
            onPressed: (){
              Navigator.of(context).pop(true);
            }),
      ],
      content: Container(
        height: height*(2/5),
        width: width,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  setState(() {
                    _selected = items[index];
                    _target = "country_french";
                  });
                  print(_selected);
                  Navigator.of(context).pop(true);
                },
                title: Text("${items[index]}",style: textStyle,),
              );
            }
        ),
      ),
    )..show();
  }

}
