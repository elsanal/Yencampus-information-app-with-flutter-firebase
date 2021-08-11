import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/Countries.dart';
import 'package:yencampus/Database/JobType.dart';
import 'package:yencampus/Database/JobCategories.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/menuItemSelection.dart';
import 'package:yencampus/Function/translation.dart';

class Job extends StatefulWidget {
  const Job({Key? key}) : super(key: key);
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  List<String> _items = ["all","isOpenn","category","country","job_type"];
  var _selected = '';
  var _selectedList = [];
  String _target = '';
  bool isArrayTarget = false;
  int _selectedIndex=0;
  String lang = '';

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
                      context,_menuBar(width, _items),'job')),
              _selected==""?pageBody(context,"job"):
              _selected=="true"?filterBody(context, 'job', _target, true,false):
              isArrayTarget?filterBody(context, 'job', _target, _selectedList,isArrayTarget):
              filterBody(context, 'job', _target, _selected,isArrayTarget),
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
              if(items[index]=="category"){
                lang=="fr"?selectCountry(context, jobCategory['fr'],items[index]):
                selectCountry(context, jobCategory['en'],items[index]);
              }else if(items[index]=="country"){
                lang=="fr"?selectCountry(context, countries['fr'],items[index]):
                selectCountry(context, countries['en'],items[index]);
              }else if(items[index]=="job_type"){
                lang=="fr"?selectCountry(context, jobType['fr'],items[index]):
                selectCountry(context, jobType['en'],items[index]);
              } else{
                result = switchItem(items[index]);
                setState(() {
                  _selected = result[0];
                  _target = result[1];
                });
              }
              print(result);
            },
            child: pageMenuBar(translate(context,items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }

  selectCountry(BuildContext context,var items, String type){
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
                    if(type=="country"){
                      setState(() {
                        _selected = items[index];
                        _target = lang=="fr"?"country_french":"country_english";
                      });
                    }else if(type=="category"){
                      _selectedList.clear();
                      setState(() {
                        isArrayTarget = true;
                        _selectedList.add(items[index]);
                        _target = lang=="fr"?"category_french":"category_english";
                      });
                    }else if(type=="job_type"){
                      _selectedList.clear();
                      setState(() {
                        isArrayTarget = true;
                        _selectedList.add(items[index]);
                        _target = lang=="fr"?"contrat_type_french":"contrat_type_english";
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
