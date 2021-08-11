import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Function/urlLauncher.dart';

class AppBarImageSwiper extends StatefulWidget {
  final images;
  final title;
  AppBarImageSwiper({required this.images, required this.title});

  @override
  _AppBarImageSwiperState createState() => _AppBarImageSwiperState();
}

class _AppBarImageSwiperState extends State<AppBarImageSwiper> with TickerProviderStateMixin{
  @override
  var _images;
  var _title ;
  List<String> _localImage = [
    "assets/menuSwiper/hat0.jpeg",
    "assets/menuSwiper/hat1.jpeg",
    "assets/menuSwiper/hat3.jpeg",
    "assets/menuSwiper/hat4.jpeg",
  ];
  late AnimationController _animationController = AnimationController(vsync: this, duration: Duration(seconds:10));
  late SwiperController _swiperController;
  late AnimationController _animationController1 = AnimationController(vsync: this, duration: Duration(seconds:10));
  late SwiperController _swiperController1;
  @override
  void initState() {
    _images = widget.images;
    _title = widget.title;
    _animationController = AnimationController(vsync: this, duration: Duration(seconds:10))..repeat();
    _swiperController = new SwiperController();
    _animationController1 = AnimationController(vsync: this, duration: Duration(seconds:10))..repeat();
    _swiperController1 = new SwiperController();
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: ScreenUtil().setHeight(height/1.2),
        child: FutureBuilder(
          future: _images,
          builder: (context,AsyncSnapshot snapshot) {
            if(!snapshot.hasData){
              return Swiper(
                scrollDirection: Axis.horizontal,
                itemHeight: width,
                itemWidth: width,
                viewportFraction: 0.90,
                scale: 0.7,
                fade: 0.9,
                loop: true,
                index: _swiperController1.index,
                controller: _swiperController1,
                curve: Curves.easeOutSine,
                autoplayDisableOnInteraction: false,
                duration: 500,
                autoplay: true,
                itemCount: _localImage.length,
                physics: ScrollPhysics(),
                containerHeight: width,
                containerWidth: width,
                itemBuilder: (context,index){
                  return Container(
                    width: width,
                    height: ScreenUtil().setHeight(height/2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_localImage[index]),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        )
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            )
                        ),
                        child: Text(translate(context, _title),style: titleStyle.copyWith(
                        ),),
                      ),),
                  );
                },
              );
            }
            else{
              return Swiper(
                scrollDirection: Axis.horizontal,
                itemHeight: width,
                itemWidth: width,
                viewportFraction: 0.90,
                scale: 0.7,
                fade: 0.9,
                loop: true,
                index: _swiperController.index,
                controller: _swiperController,
                curve: Curves.easeOutSine,
                duration: 500,
                autoplayDisableOnInteraction: false,
                autoplayDelay: 1,
                autoplay: true,
                itemCount: snapshot.data!.length,
                physics: ScrollPhysics(),
                containerHeight: width,
                containerWidth: width,
                itemBuilder: (context,index){
                var doc = snapshot.data[index];
                return InkWell(
                  onTap: ()=>UlrLauncher(context, doc.url),
                  child: Container(
                    width: width,
                    height: ScreenUtil().setHeight(height/2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(doc.image),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        )
                    ),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                )
                            ),
                            child: Text(translate(context, _title),style: titleStyle.copyWith(
                            ),),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(5),
                          child: Text(doc.title,style: titleStyle2.copyWith(
                            backgroundColor: Colors.grey[100]
                          ),),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );}
          }
        )
    );
  }
}
