import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/HomeAppBar.dart';
import 'package:yencampus/Components/SliverList.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Pages/Homepage.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({Key? key}) : super(key: key);

  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  List<String> items = ["All","Most recent","Popular","Fully funded",
    "Partially funded","More"];
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
          child: Stack(
            children: [
              Positioned(
                top: ScreenUtil().setHeight(0),
                child: new Container(
                  height: ScreenUtil().setHeight(360),
                  width: width,
                  child: appBar(context,Homepage(),items),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(360),
                left: ScreenUtil().setHeight(15),
                right: ScreenUtil().setHeight(15),
                // bottom: 0,
                child: new Container(
                  height:height-ScreenUtil().setHeight(450),
                  width: ScreenUtil().setWidth(width),
                  padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(100)
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(60)
                        ),
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey[300],
                          child: Container(
                            height: height/2,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Container(
                                  height: height/3,
                                  width: width,
                                  alignment: Alignment.bottomCenter,
                                  decoration:BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/hat$index.jpeg")
                                    )
                                  ),
                                  child: Text(" Country : China \n"
                                    ' Deadline : 2021-07-25 \n',
                                    textAlign: TextAlign.center,
                                    style: textStyle.copyWith(
                                    backgroundColor: Colors.white.withOpacity(0.5),
                                  ),),),
                                new Container(
                                  margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                                  color: Colors.grey[400],height: 1,width: width*(3/5),),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: new Text("The most wanted scholarship. Chinese Government Scholarship "
                                        "is open now. i am going to apply for it."
                                        "The most wanted scholarship. Chinese Government Scholarship"
                                        "is open now. i am going to apply for it.",style: textStyle,
                                      maxLines:5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                // new Container(height: 3,)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
