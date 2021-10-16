import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/Countries.dart';
import 'package:yencampus/Database/LevelList.dart';
import 'package:yencampus/Database/PopUpList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/menuItemSelection.dart';
import 'package:yencampus/Function/translation.dart';

class Scholarship extends StatefulWidget {
  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {

  List<String> _items = ["all","isOpenn","popular_scholar","full_funded",
                          "part_funded","more"];
  var _selected = "";
  var _selectedList = [];
  String _target = '';
  int _selectedIndex=0;
  String lang='';
  bool isArrayTarget=false;

  @override
  Widget build(BuildContext context) {
    lang = getLocale(context);
    var width = MediaQuery.of(context).size.width;
    Admob().myInterstitialAd();
    return SafeArea(
      child: Scaffold(
        body: new CustomScrollView(
          slivers: [
           pageAppBar(
               appBarBackground(
                   context,_menuBar(context,width, _items),'scholar')),
            _selected==""?pageBody(context,"scholar"):
            _selected=="true"?filterBody(context, 'scholar', _target, true,false):
            _selected=="false"?filterBody(context, 'scholar', _target, false,false):
            isArrayTarget?filterBody(context, 'scholar', _target, _selectedList,isArrayTarget)
                :filterBody(context, 'scholar', _target, _selected,isArrayTarget),
          ],
        )
      ),
    );
  }

  Widget _menuBar(BuildContext context,double width, List<String> items){
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
              if(items[index]!="more"){
                result = switchItem(items[index]);
                setState(() {
                  _selected = result[0];
                  _target = result[1];
                });
              }
              // print(result);
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
        color: Colors.grey[100],
        child: Text(translate(context, "more"),style: titleStyle2.copyWith(
            fontSize: ScreenUtil().setSp(40),
            fontWeight: FontWeight.bold
        ),),
        itemBuilder: (_context) => scholarPopUpList
            .map<PopupMenuItem>((element) => PopupMenuItem(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Expanded(
                   child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(3),
                    color: Colors.white,
                    child: Text(translate(context,element['name']),
                      style: titleStyle2,
                    )),
                 ),
               ],
             ),
                value: element['value'],
        ))
            .toList(),
        onSelected: (result){
          var value = (result.toString());
          var index = int.parse(value);
          if(scholarPopUpList[index]['name']=="country"){
            lang=="fr"?selectCountry(context, countries['fr'],scholarPopUpList[index]['name']):
            selectCountry(context, countries['en'],scholarPopUpList[index]['name']);
          }else if(scholarPopUpList[index]['name']=="level"){
            lang=="fr"?selectCountry(context, Level['fr'],scholarPopUpList[index]['name']):
            selectCountry(context, Level['en'],scholarPopUpList[index]['name']);
          } else{
            List result = [];
            result = switchItem(scholarPopUpList[index]['name']);
            setState(() {
              _selected = result[0];
              _target = result[1];
            });
          }
        },
      ),
    );
  }

  selectCountry(BuildContext context,var items,String type){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Alert(
      title: translate(context,'select'),
      context: context,
      style: AlertStyle(
        backgroundColor: Colors.grey[100],
        titleStyle: titleStyle2,
      ),
      buttons: [
        DialogButton(
            color: Colors.red.withOpacity(0.3),
            child: Text(translate(context,'cancel'),style: titleStyle2,),
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
                    if(type=="country"){
                      _selectedList.clear();
                      if(items[index]== ("All the countries")||items[index]==("Tous les pays")){
                        _selected = "";
                      }else{
                        setState(() {
                          isArrayTarget = false;
                          _selected = items[index];
                          _target = lang=="fr"?"country_french":"country_english";
                        });
                      }

                    }else if(type=="level"){
                      _selectedList.clear();
                      setState(() {
                        isArrayTarget = true;
                        _selectedList.add(items[index]);
                        _target = lang=="fr"?"level_french":"level_english";
                      });
                    }
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





