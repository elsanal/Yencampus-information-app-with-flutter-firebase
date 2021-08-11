import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesDetails/DetailsComp.dart';
import 'package:yencampus/Decoration/Fonts.dart';

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

embListToString(BuildContext context,List items){
 return ListView.builder(
   shrinkWrap: true,
   physics: NeverScrollableScrollPhysics(),
   itemCount: items.length,
     itemBuilder: (context,index){
       return Column(
         children: [
           SizedBox(height: ScreenUtil().setHeight(40),),
           Container(
             width: MediaQuery.of(context).size.width,
             child: Row(
               children: [
                 Icon(Icons.ac_unit_rounded),
                 Expanded(
                   child: Container(
                     padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                     child: new Text(items[index]['depart_name'],style: titleStyle2.copyWith(
                         fontSize: ScreenUtil().setSp(60),
                         // backgroundColor: Colors.black87,
                         color: Colors.black
                     ),
                       overflow: TextOverflow.ellipsis,
                       maxLines: 10,
                     ),
                   ),
                 ),
               ],
             ),
           ),
           items[index]['major']!=null?
           embListToString2(items[index]['major']):
               Container()
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
            body("<p> - "+ items[index]['major_name']+"</p>"),
          ],
        );
      }
  );
}