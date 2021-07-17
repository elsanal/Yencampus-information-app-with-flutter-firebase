import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/DetailsComp.dart';
import 'package:yencampus/Components/PagesBody.dart';


listToString(List items){
  String result = '';
  for(int i=0;i<items.length;i++){
    if(items.length-i == 1){
      result += (items[i].toString());
    }else{
      result += (items[i].toString()+ ', ');
    }
  }
  return result;
}

embListToString(List items){
 return ListView.builder(
   shrinkWrap: true,
   physics: NeverScrollableScrollPhysics(),
   itemCount: items.length,
     itemBuilder: (context,index){
       return Column(
         children: [
           SizedBox(height: ScreenUtil().setHeight(40),),
           title2(items[index]['depart_name_french']),
           embListToString2(items[index]['major_french'])
         ],
       );
     }
 );
}

embListToString2(List items){
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            body("<p> - "+ items[index]['major_name_french']+"</p>"),
          ],
        );
      }
  );
}