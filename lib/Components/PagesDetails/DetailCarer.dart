import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/PagesDetails/DetailsComp.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/CarerClass.dart';

Widget detailCarer(BuildContext context, CarerClass doc, bool isLocal,List<BannerAd> myBannerAd){
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            new Container(child: Image.network(
              doc.images[1]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            body(doc.description),
            Container(
              height: ScreenUtil().setHeight(250),
              width: width,
              child: AdWidget(ad: myBannerAd[0]),
            ),
            new Container(child: Image.network(
              doc.images[2]['src']['src'], fit: BoxFit.fill,),),
            title2(translate(context, "advantage")),
            body(doc.advantage),
            Container(
              height: ScreenUtil().setHeight(250),
              width: width,
              child: AdWidget(ad: myBannerAd[1]),
            ),
            new Container(child: Image.network(
              doc.images[3]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),
            title2(translate(context, "disadvantage")),
            body(doc.disadvantage),
            Container(
              height: ScreenUtil().setHeight(250),
              width: width,
              child: AdWidget(ad: myBannerAd[2]),
            ),
            new Container(child: Image.network(
              doc.images[0]['src']['src'], fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            new Container(
              width: width,
              color: Colors.grey,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  isLocal?actionButton(context,"delete",Icons.save_rounded,Colors.blue,doc,"carer"):
                  actionButton(context,"save",Icons.save_rounded,Colors.green,doc,"carer"),
                  actionButton(context,"share",Icons.share_rounded,Colors.deepOrange,doc,"carer")
                ],
              ),
            ),
            // new SizedBox(height: 10,),
          ],
        )
    ),
  );
}