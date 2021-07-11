import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/HomePageContent.dart';
import 'package:yencampus/Components/Loading.dart';
import 'package:yencampus/Components/PagesDetails/DetailScholar.dart';
import 'package:yencampus/Components/HomePageItems.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';
import 'package:yencampus/Function/getCareerData.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';
import 'package:yencampus/Pages/Carrer.dart';
import 'package:yencampus/Pages/Saved.dart';
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

  List<String> _items = ["Scholarships","Universities","Jobs","Carer","Tips","Saved"];
  List<Widget> _pages = [Scholarship(),University(),Job(),Carer(),Tips(),Saved()];

  late Future<List<ScholarshipGnClass>> _scholarData;
  late Future<List<UniversityClass>> _univData;
  late Future<List<JobClass>> _jobData;
  late Future<List<CarerClass>> _carerData;
  String selected = 'all';
  String input = '';
  int _selectedIndex=-1;


  @override
  void initState(){
    // TODO: implement initState
    _scholarData =  getTargetScholarship("deadline",getDate());
    _univData = getTargetUniversity("school_fee",'free');
    _jobData = getTargetJob("deadline",getDate());
    _carerData = getCarer();
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
          child: CustomScrollView(
            slivers: [
              pageAppBar(
                  homeAppBarBackground(
                      context,_formField(width),_menuBar(width, _items))),
              SliverToBoxAdapter(
                child:ListView(
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
                    homePageItems(context,"Discover Carer",_carerData,"carer"),
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
                _selectedIndex = index;
                selected = items[index];
              });
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=>_pages[index]));
              Future.delayed(Duration(seconds: 1),(){setState(() {
                _selectedIndex = -1;
              });});
            },
            child: pageMenuBar(items[index],index,_selectedIndex),
          );
        },
      ),
    );
  }


}



