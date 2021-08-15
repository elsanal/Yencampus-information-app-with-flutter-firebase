import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yencampus/Admob.dart';
import 'package:yencampus/Components/PagesDetails/DetailAppbar.dart';
import 'package:yencampus/Components/PagesDetails/DetailCarer.dart';
import 'package:yencampus/Components/PagesDetails/DetailScholar.dart';
import 'package:yencampus/Components/PagesDetails/DetailJob.dart';
import 'package:yencampus/Components/PagesDetails/DetailTip.dart';
import 'package:yencampus/Components/PagesDetails/DetailUniv.dart';


class Details extends StatefulWidget {
  final doc;
  String type;
  bool isLocal;
  Details({required this.doc, required this.type,required this.isLocal});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late final doc;
  late String type;
  late bool isLocal;

  List<BannerAd> myBanners = [
    Admob().myBannerAd,
    Admob().myBannerAd1,
    Admob().myBannerAd2,
    Admob().myBannerAd3
  ];

  @override
  void initState() {
    // TODO: implement initState
    doc = widget.doc;
    type = widget.type;
    isLocal = widget.isLocal;
    for(int i=0;i<myBanners.length;i++){
      myBanners[i].load();
    }
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    for(int i=0;i<myBanners.length;i++){
      myBanners[i].dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Admob().myRewardInterstitialAd();
    Admob().myVideoAdLoading();
    return Scaffold(
      body: CustomScrollView(
       physics: ScrollPhysics(),
        slivers: [
          type != "tip"?sliverAppBar(context,doc.name,doc.images[0]['src']['src'],false):
          sliverAppBar(context,doc[0]['title'],'',true),
          _type()
        ],
      ),
    );
  }
  _type(){
    switch(type){
      case "scholar":
        return detailScholar(context,doc,isLocal,myBanners);
      case "univ":
        return detailUniv(context,doc,isLocal,myBanners);
      case "job":
        return detailJob(context,doc,isLocal,myBanners);
      case "carer":
        return detailCarer(context,doc,isLocal,myBanners);
      case "tip":
        return detailTip(tips: doc);
      default :
        return SliverToBoxAdapter(child: Container(),);
    }
  }
}


