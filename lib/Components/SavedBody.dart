import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/Loading.dart';
import 'package:yencampus/Components/PagesDetails/Details.dart';
import 'package:yencampus/Database/sqflite.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/getCareerData.dart';
import 'package:yencampus/Function/getJobData.dart';
import 'package:yencampus/Function/getScholarshipData.dart';
import 'package:yencampus/Function/getUniversityData.dart';
import 'package:yencampus/Function/sharePost.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/SavedClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Models/UniversityClass.dart';

ValueNotifier<bool> isLoading = ValueNotifier(false);

Widget savedBody(BuildContext context, String type){

  return SliverToBoxAdapter(
    child: new Container(
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
                          child: Center(child: Text(translate(context, "error"),style: titleStyle,),));
                    }else if(snapshot.connectionState == ConnectionState.waiting){
                      return Container(
                          alignment: Alignment.topCenter,
                          child: Center(child: Text(translate(context, "waiting"),style: titleStyle,),));
                    }else if(!snapshot.hasData){
                      return Container(
                          alignment: Alignment.topCenter,
                          child: Center(child: Text(translate(context, "no_saved"),style: titleStyle2,),));
                    }else if(snapshot.hasData) {
                      List<SavePost> docs = snapshot.data;
                      List<SavePost> newDocs = [];
                      for(int i=0;i<docs.length;i++){
                        if(type==docs[i].type){
                          newDocs.add(snapshot.data![i]);
                          }
                      }
                      return type=='all'?_listBuilder(context,docs,type):
                                          _listBuilder(context,newDocs,type);
                    }else{
                      return Container(
                          alignment: Alignment.topCenter,
                          child: Center(child: Text(translate(context, "waiting"),style: titleStyle,),));
                    }
                  }
              ):Container(child: Text("Loading"),);
            }
        )
    ),
  );
}

Widget _listBuilder(BuildContext context,List<SavePost> docs, String type){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  var lang = getLocale(context);
  return Container(
    width: width,
    height: docs.length<=1?height*(0.5)*(docs.length):
    height*(0.24)*(docs.length),
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: docs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1
      ),
      itemBuilder: (context,index){
       return _category(lang, docs[index].type, width, height,docs[index].id);
      },
    ),
  );
}

/// Identify the type of post and retrieve it data from firebase
_category(String lang,String type,double width, double height,String id){
  switch(type){
    case "scholar":
      return FutureBuilder<List<ScholarshipGnClass>>(
          future: getTargetScholarship(lang,"id",id),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Container(
                  alignment: Alignment.topCenter,
                  child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text(translate(context, "error"),style: titleStyle2,),),);
            }
            else{
              final item = snapshot.data![0];
              return _item(context, width, item, type,);
            }
          }
      );
    case "univ":
      return FutureBuilder<List<UniversityClass>>(
          future: getTargetUniversity(lang,"id", id),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                  alignment: Alignment.topCenter,
                  child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text(translate(context, "error"),style: titleStyle2,),),);
            }
            else{
              final item = snapshot.data![0];
              return _item(context, width, item, type,);
            }
          }
      );
    case "job":
      return FutureBuilder<List<JobClass>>(
          future: getTargetJob(lang,'id', id),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                  alignment: Alignment.topCenter,
                  child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text(translate(context, "error")),),);
            }
            else{
              final item = snapshot.data![0];
              return _item(context, width, item, type,);
            }
          }
      );
    case "carer":
      return FutureBuilder<List<CarerClass>>(
          future: getTargetCarer(lang,'id', id),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(
                  alignment: Alignment.topCenter,
                  child: Loading());
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.topCenter,
                child: Center(child: Text(translate(context, "error"),style: titleStyle2,),),);
            }
            else{
              final item = snapshot.data![0];
              return _item(context, width, item, type,);
            }
          }
      );
  }
}


Widget _item(BuildContext context,double width,final item, String type,){
  return Card(
    child: Container(
      child: GestureDetector(
        onTap: ()=>Navigator.push(context,
            new MaterialPageRoute(builder: (context)=>Details(doc: item,type: type,isLocal:true))),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                height: ScreenUtil().setHeight(310),
                width: width,
                alignment: Alignment.bottomCenter,
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${item.images[0]['src']['src']}"),
                        fit: BoxFit.contain
                    )
                ),
                child: type!="carer"?Text(translate(context, "country")+": ${item.country}\n"
                    ' ${item.deadline} \n',
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      fontSize: ScreenUtil().setSp(40)
                  ),):Container(),),
              Text(item.name,
                  textAlign: TextAlign.left,
                  style: titleStyle2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(35)
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(parseHtmlString(item.description),style: textStyle,
                    maxLines: 4,overflow: TextOverflow.ellipsis,),
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
                            new MaterialPageRoute(
                                builder: (context)=>Details(
                                    doc: item,type: type,isLocal:true))),
                        child: _actionButton(translate(context, "read_more"))),
                    new Container(height: 40,width: 1,color: Colors.grey[400],),
                    InkWell(
                        onTap: (){
                          isLoading.value = true;
                          localDB(tableName: "YENCAMPUS").delete(int.parse(item.id));
                          final snackBar = SnackBar(
                            content: Text(translate(context, "deleted")),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Future.delayed(Duration(milliseconds: 100),()=>isLoading.value=false);
                        },
                        child:_actionButton(translate(context, "delete"))),
                    new Container(height: 40,width: 1,color: Colors.grey,),
                    InkWell(
                        onTap: (){
                          sharePost(context,item, type);
                        },
                        child: _actionButton(translate(context, "share"))),
                  ],
                ),
              ),
              // new Container(height: 5,color: Colors.grey[500],)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _actionButton(String action,){
  return Text(action,style: titleStyle.copyWith(
    fontSize: ScreenUtil().setSp(30),
    color: Colors.grey[800],
  ),);
}

