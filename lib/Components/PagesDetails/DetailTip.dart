import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/translation.dart';

class detailTip extends StatefulWidget {
  final tips;
  detailTip({required this.tips});

  @override
  _detailTipState createState() => _detailTipState();
}

class _detailTipState extends State<detailTip> with TickerProviderStateMixin{

  late var _tips;

  late AnimationController _animationController = AnimationController(vsync: this, duration: Duration(seconds:10));
  late SwiperController _swiperController;
  @override
  void initState() {
    _tips = widget.tips;
    _animationController = AnimationController(vsync: this, duration: Duration(seconds:10))..repeat();
    _swiperController = new SwiperController();
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Container(
        height: width,
          width: width,
          child: Swiper(
            scrollDirection: Axis.horizontal,
            itemHeight: width,
            itemWidth: width,
            viewportFraction: 0.9,
            scale: 0.9,
            fade: 0.4,
            // onTap: (value){
            //   print(value);
            // },
            // onIndexChanged: (value)async{
            // },
            loop: false,
            index: _swiperController.index,
            controller: _swiperController,
            autoplayDisableOnInteraction: true,
            curve: Curves.easeOutSine,
            duration: 500,
            itemCount: _tips.length-1,
            physics: ScrollPhysics(),
            containerHeight: width,
            containerWidth: width,
            itemBuilder: (context,index){
              var tip = _tips[index+1];
              return Container(
                padding: EdgeInsets.only(
                    left: 5,
                    right: 5
                ),
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: ()=>_swiperController.previous(animation: true),
                            child: Row(children: [
                              new Icon(Icons.arrow_back_rounded),
                              new Text(translate(context, "previous"))
                            ],),
                          ),
                          new CircleAvatar(radius: ScreenUtil().setWidth(80),
                          child: Text("${index+1} / ${_tips.length-1}"),),
                          InkWell(
                            onTap: ()=>_swiperController.next(animation: true),
                            child: Row(children: [
                              new Text(translate(context, "next")),
                              new Icon(Icons.arrow_forward_rounded),
                            ],),
                          ),
                        ],
                      ),
                      new Text("${tip['title']}",style: titleStyle2.copyWith(
                        fontSize: ScreenUtil().setSp(50)
                      ),),
                      Expanded(child: ListView(
                        physics: ScrollPhysics(),
                        children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 5,
                              right: 5
                          ),
                          child: new Text("${tip['description']}",style: textStyle,
                          textAlign: TextAlign.justify,),
                        )
                      ],))
                    ],
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
