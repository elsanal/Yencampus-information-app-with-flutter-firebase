import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Components/Loading.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Function/getCareerData.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/SavedClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';
import 'package:yencampus/Pages/Scholarship.dart';

/// Widget to show the posts of each category
Widget pageBody(BuildContext context, String target, String type){
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
      child: _category(type, width, height,false,'null')
    ),
  );
}

/// Widget to show the different saved posts
ValueNotifier<int> length = ValueNotifier(2);
ValueNotifier<bool> isLoading = ValueNotifier(false);
Widget SavedBody(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
    child: new Container(
        height:height*(length.value*0.54),
        width: width,
        padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(50),
            top: ScreenUtil().setHeight(50)
        ),
        child: ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (context,value,widget){
            return value==false?FutureBuilder<List<SavePost>>(
              future: localDB(tableName: "YENCAMPUS").readFromDB(),
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.hasError){
                    return Container(
                        alignment: Alignment.topCenter,
                        child: Center(child: Text("An error...",style: titleStyle,),));
                  }else if(snapshot.connectionState == ConnectionState.waiting){
                    return Container(
                        alignment: Alignment.topCenter,
                        child: Center(child: Text("Waiting...",style: titleStyle,),));
                  }else if(!snapshot.hasData){
                    return Container(
                      alignment: Alignment.topCenter,
                        child: Center(child: Text("There is not saved posts",style: titleStyle2,),));
                  }else if(snapshot.hasData) {
                    List<SavePost> docs = snapshot.data;
                     length.value = docs.length;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context,index){
                          return _category(docs[index].type, width, height, true, docs[index].id.toString());
                        }
                    );

                  }else{
                    return Container(
                        alignment: Alignment.topCenter,
                        child: Center(child: Text("Waiting...",style: titleStyle,),));
                  }
                }
            ):Loading();
          }
        )
    ),
  );
}

/// widget to show the filter posts
 Widget filterBody(BuildContext context,String type, String target, final value){
   var height = MediaQuery.of(context).size.height;
   var width = MediaQuery.of(context).size.width;
   return SliverToBoxAdapter(
     child: new Container(
         height:height*(5*0.53),
         width: width,
         padding: EdgeInsets.only(
             bottom: ScreenUtil().setHeight(50),
             top: ScreenUtil().setHeight(50)
         ),
         child: _filterCategory(type, width, height,target,value)
     ),
   );
}

/// Identify the type of post and retrieve it data from firebase
_category(String type,double width, double height,bool isLocal,String id){
  switch(type){
    case "scholar":
      return FutureBuilder<List<ScholarshipGnClass>>(
          future: isLocal?getTargetScholarship("id",id):getScholarship(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type,isLocal);
            }
          }
      );
    case "univ":
      return FutureBuilder<List<UniversityClass>>(
          future: isLocal?getTargetUniversity("id", id):getUniversity(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type,isLocal);
            }
          }
      );
    case "job":
      return FutureBuilder<List<JobClass>>(
          future: isLocal?getTargetJob('id', id):getJob(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ..."),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, isLocal);
            }
          }
      );
    case "carer":
      return FutureBuilder<List<CarerClass>>(
          future: isLocal?getTargetCarer('id', id):getCarer(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, isLocal);
            }
          }
      );
  }
}

_filterCategory(String type,double width, double height,String target, final value){
  switch(type){
    case "scholar":
      return FutureBuilder<List<ScholarshipGnClass>>(
          future: getTargetScholarship(target,value),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, false);
            }
          }
      );
    case "univ":
      return FutureBuilder<List<UniversityClass>>(
          future: getTargetUniversity(target,value),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, false);
            }
          }
      );
    case "job":
      return FutureBuilder<List<JobClass>>(
          future: getTargetJob(target,value),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, false);
            }
          }
      );
    case "carer":
      return FutureBuilder<List<CarerClass>>(
          future: getTargetCarer(target,value),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                alignment: Alignment.topCenter,
                child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text("Error ...",style: titleStyle2,),),);
            }
            else{
              return _listBuilder(snapshot, width, height, type, false);
            }
          }
      );
  }
}

Widget _listBuilder(AsyncSnapshot snapshot, double width, double height, String type,bool isLocal){
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: snapshot.data!.length,
    itemBuilder: (context,index){
      final item = snapshot.data![index];
      return Container(
        margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(60)
        ),
        child: Container(
          height: height*(2/4.1),
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
                        fit: BoxFit.contain
                    )
                ),
                child: type!="carer"?Text(" Country : ${item.country_fr}\n"
                    ' ${item.deadline} \n',
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(
                    backgroundColor: Colors.white.withOpacity(0.5),
                  ),):Container(),),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(parseHtmlString(item.description_fr),style: textStyle,
                  maxLines: 3,overflow: TextOverflow.ellipsis,),
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
                            new MaterialPageRoute(builder: (context)=>Details(doc: item,type: type,isLocal:isLocal))),
                        child: _actionButton("Read more")),
                    new Container(height: 40,width: 1,color: Colors.grey[400],),
                    InkWell(
                      onTap: (){
                        if(isLocal){
                          isLoading.value = true;
                          localDB(tableName: "YENCAMPUS").delete(int.parse(item.id));
                          final snackBar = SnackBar(
                            content: Text("Deleted"),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Future.delayed(Duration(milliseconds: 100),()=>isLoading.value=false);
                        }else{
                          localDB(tableName: "YENCAMPUS").saveOndB(SavePost(type:type, id:(item.id).toString()));
                          final snackBar = SnackBar(
                            content: Text("Saved"),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                        child: isLocal?_actionButton("Delete"):_actionButton("Save")),
                    new Container(height: 40,width: 1,color: Colors.grey,),
                    InkWell(
                      onTap: (){
                        sharePost(item, type);
                      },
                        child: _actionButton("Share")),
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


Widget _actionButton(String action,){
  return Text(action,style: titleStyle.copyWith(
    fontSize: ScreenUtil().setSp(50),
    color: Colors.grey[800],
  ),);
}
