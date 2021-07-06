import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/HomePageContent.dart';
import 'package:yencampus/Components/DetailScholar.dart';
import 'package:yencampus/Components/HomePageItems.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';
import 'package:yencampus/Pages/Carrer.dart';
import 'package:yencampus/Pages/Exams.dart';
import 'package:yencampus/Pages/Job.dart';
import 'package:yencampus/Pages/Scholarship.dart';
import 'package:yencampus/Pages/Tips.dart';
import 'package:yencampus/Pages/University.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> _items = ["Scholarships","Universities","Jobs","Carer","Tips"];
  List<Widget> _pages = [Scholarship(),University(),Job(),Carrer(),Tips()];

  late Future<List<ScholarshipGnClass>> _scholarData;
  late Future<List<UniversityClass>> _univData;
  late Future<List<JobClass>> _jobData;
  String selected = 'all';
  String input = '';

  @override
  void initState(){
    // TODO: implement initState
    _scholarData =  getTargetScholarship(_getDate());
    _univData = getTargetUniversity('free');
    _jobData = getTargetJob(_getDate());
    super.initState();
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
          child: CustomScrollView(
            slivers: [
              pageAppBar(
                  homeAppBarBackground(
                      context,_formField(width),_menuBar(width, _items))),
              SliverToBoxAdapter(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    homePageItems(context,"Available Scholarships",_scholarData,"scholar"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
                    homePageItems(context,"Free Universities",_univData,"univ"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
                    homePageItems(context,"Available Jobs",_jobData,"job"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
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
            ],
          ),
        ),
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
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=>_pages[index]));
            },
            child: pageMenuBar(items[index]),
          );
        },
      ),
    );
  }


}



