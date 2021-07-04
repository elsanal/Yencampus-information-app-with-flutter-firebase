import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/getFirebaseData.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Pages/Scholarship.dart';

Widget pageBody(BuildContext context, String target){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: new Container(
      height:height*(3*0.53),
      width: width,
      padding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(50),
          top: ScreenUtil().setHeight(50)
      ),
      child: FutureBuilder<List<ScholarshipGnClass>>(
        future: getScholarship(),
        builder: (context, snapshot) {

          if(!snapshot.hasData){
            return Container(child: Center(child: Text("No data"),),);
          }
          else if(snapshot.hasError){
            return Container(child: Center(child: Text("Error occured"),),);
          }
          else{
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                ScholarshipGnClass item = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(60)
                  ),
                  child: Container(
                    height: height*(2/4.15),
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Container(
                          height: height/3,
                          width: width,
                          alignment: Alignment.bottomCenter,
                          decoration:BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${item.images[0]['src']['src']}"),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Text(" Country : ${item.country_fr}\n"
                              ' ${item.deadline} \n',
                            textAlign: TextAlign.center,
                            style: textStyle.copyWith(
                              backgroundColor: Colors.white.withOpacity(0.5),
                            ),),),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Html(data: item.description_fr),
                          ),
                        ),
                        new Container(
                          width: width,
                          height: 40,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Colors.grey.shade500,width: 1,style: BorderStyle.solid),
                              bottom: BorderSide(
                                  color: Colors.white,width: 1,style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap:()=>Navigator.push(context,
                                      new MaterialPageRoute(builder: (context)=>Details(doc: item,))),
                                  child: _actionButton("Read more")),
                              new Container(height: 40,width: 1,color: Colors.grey[400],),
                              _actionButton("Save"),
                              new Container(height: 40,width: 1,color: Colors.grey,),
                              _actionButton("Share"),
                            ],
                          ),
                        ),
                        new Container(height: 5,color: Colors.grey[500],)
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }
      ),
    ),
  );
}

Widget _actionButton(String action,){
  return Text(action,style: titleStyle.copyWith(
    fontSize: ScreenUtil().setSp(50),
    color: Colors.grey[800],
  ),);
}