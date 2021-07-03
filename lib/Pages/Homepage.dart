import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/HomePageContent.dart';
import 'package:yencampus/Components/DetailBody.dart';
import 'package:yencampus/Decoration/Fonts.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    print("Homepage");
    super.initState();
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
                      category("New Posts"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context)),
                      Container(height: 15,),
                      category("Popular Scholarships"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context)),
                      Container(height: 15,),
                      category("Available Jobs"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context)),
                      Container(height: 15,),
                      category("Exams Preparation"),
                      Container(
                          height: ScreenUtil().setHeight(height),
                          width: ScreenUtil().setWidth(width),
                          child: homepageContent(context)),
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


