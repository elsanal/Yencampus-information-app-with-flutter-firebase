import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';

Widget detailBody(BuildContext context, DocumentSnapshot doc){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _header("Country", doc['country_english']),
            new SizedBox(height: 10,),
            _header("Level", doc['level_english'][0].toString()),
            new SizedBox(height: 10,),
            _header("Amount", doc['amount']),
            new SizedBox(height: 10,),
            _header("Duration", doc['duration']),
            new SizedBox(height: 10,),
            _header("Eligible", doc['eligible_english'][0].toString()),
            new SizedBox(height: 10,),

            new Container(child: Image.asset(
              "assets/hat2.jpeg", fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            _body("body"),
            new SizedBox(height: 20,),
            _title2("Conditions"),
            _body("body"),
            new SizedBox(height: 20,),
            _title2("Documents"),
            _body("body"),
            new SizedBox(height: 20,),

            new Container(child: Image.asset(
              "assets/hat2.jpeg", fit: BoxFit.fill,),),
            new SizedBox(height: 10,),

            _title2("How to apply ?"),
            _body("body"),
            new SizedBox(height: 20,),

            new Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton("Apply"),
                  _actionButton("Save"),
                  _actionButton("Share")
                ],
              ),
            ),
            new SizedBox(height: 10,),
          ],
        )
    ),
  );
}

Widget _header(String title, String result){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text("$title : $result",style: titleStyle2.copyWith(
        fontSize: ScreenUtil().setSp(50)
    ),),
  );
}

Widget _title2(String title){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text(title,style: titleStyle2),
  );
}

Widget _body(String body){
  return Container(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: new Text("The most wanted scholarship. Chinese Government Scholarship "
        "is open now. i am going to apply for it."
        "The most wanted scholarship. Chinese Government Scholarship"
        "is open now. i am going to apply for it.",style: textStyle,
      // maxLines:,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.justify,
    ),
  );
}

Widget _actionButton(String action,){
  return new ElevatedButton(
      style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.grey[800]),
          elevation: MaterialStateProperty.all(0.0)
      ),
      onPressed:(){},
      child:Text(action,style: titleStyle.copyWith(
        fontSize: ScreenUtil().setSp(50),
        color: Colors.white,
      ),)
  );
}