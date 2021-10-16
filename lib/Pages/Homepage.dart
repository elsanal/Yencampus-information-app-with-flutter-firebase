import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/Home/HomeAppBar.dart';
import 'package:yencampus/Components/Home/HomePageItems.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Function/getCareerData.dart';
import 'package:yencampus/Function/getImageData.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/ImageClass.dart';
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
  String lang;
  Homepage({required this.lang});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> _items = ["scholar","univ","job","majors","tip","saved"];
  List<Widget> _pages = [Scholarship(),University(),Job(),Carer(),Tips(),Saved()];
  late Future<List<ScholarshipGnClass>> _scholarData;
  late Future<List<UniversityClass>> _univData;
  late Future<List<JobClass>> _jobData;
  late Future<List<CarerClass>> _carerData;
  late Future<List<ImageClass>> _imageData;
  String selected = 'all';
  String input = '';
  int _selectedIndex=-1;
  String lang='';
  BannerAd _bannerAd = Admob().myBannerAd;
  BannerAd _bannerAd1 = Admob().myBannerAd;
  BannerAd _bannerAd2 = Admob().myBannerAd;
  BannerAd _bannerAd3 = Admob().myBannerAd;


  @override
  void initState(){
    // TODO: implement initState
    lang = widget.lang;
    _bannerAd..load();
    _bannerAd1..load();
    _bannerAd2..load();
    _bannerAd3..load();
    if(lang!=''){
      _scholarData =  getTargetScholarship(lang,"isOpen",true);
      _carerData = getCarer(lang);
      _univData = getTargetUniversity(lang,"isPublic",true);
      _jobData = getTargetJob(lang,"isOpen",true);
      _imageData = getImage(lang);
      print("initailized");
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bannerAd.dispose();
    _bannerAd1.dispose();
    _bannerAd2.dispose();
    _bannerAd3.dispose();
    super.dispose();
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
                      context,_menuBar(width, _items),_imageData,'home')),
              SliverToBoxAdapter(
                child:ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    homePageItems(context,translate(context, 'av_scholar'),_scholarData,"scholar"),
                    Container(
                      height: ScreenUtil().setHeight(250),
                      width: width,
                      child: AdWidget(ad: _bannerAd),
                    ),
                    homePageItems(context,translate(context,"public_univ"),_univData,"univ"),
                    Container(
                      height: ScreenUtil().setHeight(250),
                      width: width,
                      child: AdWidget(ad: _bannerAd1),
                    ),
                    homePageItems(context,translate(context, "av_job"),_jobData,"job"),
                    Container(
                      height: ScreenUtil().setHeight(250),
                      width: width,
                      child: AdWidget(ad: _bannerAd2),
                    ),
                    homePageItems(context,translate(context,"disco_major"),_carerData,"carer"),
                    Container(
                      height: ScreenUtil().setHeight(250),
                      width: width,
                      child: AdWidget(ad: _bannerAd3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
              setState(() {
                _selectedIndex = index;
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



