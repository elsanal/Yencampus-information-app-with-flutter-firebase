import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/PagesDetails/Details.dart';
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
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';

class Tips extends StatelessWidget {

  List _tipHeadline = [
    "how_scholar",
    "how_univ",
    "scholar_myth",
    "how_major"
  ];
  List tipList_en = [getScholarship_en,getUniversity_en,getMyth_en,chooseMajor_en];
  List tipList_fr = [getScholarship_fr,getUniversity_fr,getMyth_fr,chooseMajor_fr];

  @override
  Widget build(BuildContext context) {
    final lang = getLocale(context);
    Admob().myInterstitialAd();
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
            slivers: [
             pageAppBar(_background(translate(context, "some_tip"))),
             lang=="fr"?_body(_tipHeadline,tipList_fr):_body(_tipHeadline,tipList_en),
            ],
          )
      ),
    );
  }
}

Widget _background(String title){
  return Container(
    margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
    decoration: BoxDecoration(
      color: Colors.deepPurple.shade600,
      borderRadius: BorderRadius.all(
        Radius.circular(ScreenUtil().setWidth(50))
      )
    ),
    alignment: Alignment.center,
    child: Text(title,style: titleStyle2.copyWith(
      color: Colors.white,
      fontSize: ScreenUtil().setSp(80),
      fontWeight: FontWeight.bold
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
                    image: AssetImage('assets/menuSwiper/hat$index.jpeg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Text(translate(context, tipHeadline[index]),
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




