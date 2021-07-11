import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Database/Tips/mythScholarshipEn.dart';
import 'package:yencampus/Database/Tips/mythScholarshipFr.dart';
import 'package:yencampus/Database/Tips/tipForMajorEn.dart';
import 'package:yencampus/Database/Tips/tipForMajorFr.dart';
import 'package:yencampus/Database/Tips/tipForScholarshipEn.dart';
import 'package:yencampus/Database/Tips/tipForScholarshipFr.dart';
import 'package:yencampus/Database/Tips/tipForUnivEn.dart';
import 'package:yencampus/Database/Tips/tipForUnivFr.dart';
import 'package:yencampus/Decoration/Fonts.dart';


class Tips extends StatelessWidget {

  List _tipHeadline = [
    "How to get Scholarship",
    "How to get admission in University",
    "The myths behind the scholarships",
    "How to choose a major"
  ];
  List tipList_en = [getScholarship_en,getUniversity_en,getMyth_en,chooseMajor_en];
  List tipList_fr = [getScholarship_fr,getUniversity_fr,getMyth_fr,chooseMajor_fr];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
            slivers: [
             pageAppBar(_background("Some tips for you")),
             _body(_tipHeadline,tipList_fr)
            ],
          )
      ),
    );
  }
}


Widget _background(String title){
  return Container(
    margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
    decoration: BoxDecoration(
      color: Colors.deepPurple.shade600,
      borderRadius: BorderRadius.all(
        Radius.circular(ScreenUtil().setWidth(50))
      )
    ),
    alignment: Alignment.center,
    child: Text(title,style: titleStyle2.copyWith(
      color: Colors.white
    ),textAlign: TextAlign.center,),
  );
}

Widget _body(List tipHeadline, List tips){
  return SliverToBoxAdapter(
    child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1
        ),
        itemCount: tipHeadline.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              print(tips[index][0]['title']);
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=>Details(doc: tips[index], type: "tip",isLocal:false)));
            },
            child: Card(
              color: Colors.white,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25))
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(25))
                    ),
                  image: DecorationImage(
                    image: AssetImage('assets/hat$index.jpeg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Text("${tipHeadline[index]}",
                  style: titleStyle.copyWith(fontSize: ScreenUtil().setSp(120),
                      backgroundColor: Colors.white.withOpacity(0.5)),
                  textAlign: TextAlign.center,
                ), 
              ),
            ),
          );
        }
    ),
  );
}




