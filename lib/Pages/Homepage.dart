import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/HomePageContent.dart';
import 'package:yencampus/Components/DetailBody.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Pages/Exams.dart';
import 'package:yencampus/Pages/Job.dart';
import 'package:yencampus/Pages/Scholarship.dart';
import 'package:yencampus/Pages/University.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> _items = ["Scholarships","Universities","Jobs","Exams"];
  List<Widget> _pages = [Scholarship(),University(),Job(),Exam()];
  List<ScholarshipGnClass> docs=[];
  String _date = '';
  @override
  void initState(){
    // TODO: implement initState
    _initData();
    _initData();
    super.initState();
  }
  _initData()async{
    docs = await getTargetScholarship(_getDate());
    print(docs[0].level_en);
  }
  String _getDate(){
    DateTime _time = DateTime.now();
    var formatDate = DateFormat('yyyy-MM-dd');
    String date = formatDate.format(_time);
    return date;
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: ScreenUtil().setHeight(0),
                child: new Container(
                  height: ScreenUtil().setHeight(360),
                  width: width,
                  child: appBar(context,_pages,_items,true),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(360),
                left: ScreenUtil().setHeight(15),
                right: ScreenUtil().setHeight(15),
                // bottom: 0,
                child: new Container(
                  height:height-ScreenUtil().setHeight(450),
                  width: ScreenUtil().setWidth(width),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      docs.length>0?category("Available Scholarships"):Container(),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context,docs)),
                      Container(height: 15,),
                      category("Free Universities"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context,docs)),
                      Container(height: 15,),
                      category("Available Jobs"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context,docs)),
                      Container(height: 15,),
                      // category("Tips to get Scholarship"),
                      // Container(
                      //     height: ScreenUtil().setHeight(height),
                      //     width: ScreenUtil().setWidth(width),
                      //     child: homepageContent(context,docs)),
                      // Container(height: 15,),
                      // category("Get admission in University"),
                      // Container(
                      //     height: ScreenUtil().setHeight(height),
                      //     width: ScreenUtil().setWidth(width),
                      //     child: homepageContent(context,docs)),
                      // Container(height: 15,),
                      Center(child: category("All right reserved")),
                      Container(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


