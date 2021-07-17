import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/HomePageItems.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Date.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/getCareerData.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Function/translation.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Homepage extends StatefulWidget {
  String lang;
  Homepage({required this.lang});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> _items = ["scholar","univ","job","carer","tip","saved"];
  List<Widget> _pages = [Scholarship(),University(),Job(),Carer(),Tips(),Saved()];

  late Future<List<ScholarshipGnClass>> _scholarData;
  late Future<List<UniversityClass>> _univData;
  late Future<List<JobClass>> _jobData;
  late Future<List<CarerClass>> _carerData;
  String selected = 'all';
  String input = '';
  int _selectedIndex=-1;
  String lang='';


  @override
  void initState(){
    // TODO: implement initState
    lang = widget.lang;

    if(lang!=''){
      _scholarData =  getTargetScholarship(lang,"deadline",getDate());
      _carerData = getCarer(lang);
      _univData = getTargetUniversity(lang,"school_fee","free");
      _jobData = getTargetJob(lang,"deadline",getDate());
      print("initailized");
    }
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
                      context,_formField(width),_menuBar(width, _items),'home')),
              SliverToBoxAdapter(
                child:ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    homePageItems(context,translate(context, 'av_scholar'),_scholarData,"scholar"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
                    homePageItems(context,translate(context,"free_univ"),_univData,"univ"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
                    homePageItems(context,translate(context, "av_job"),_jobData,"job"),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 15,color: Colors.grey[400],),
                    homePageItems(context,translate(context,"disco_carer"),_carerData,"carer"),
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
          var item = AppLocalizations.of(context)!;
          return InkWell(
            onTap: (){
              setState(() {
                _selectedIndex = index;
                // selected = items[index];
              });
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=>_pages[index]));
              Future.delayed(Duration(seconds: 1),(){setState(() {
                _selectedIndex = -1;
              });});
            },
            child: pageMenuBar(translate(context, _items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }


}



