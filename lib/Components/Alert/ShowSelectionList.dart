import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Decoration/Fonts.dart';



selectCountry(BuildContext context,List items){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  String country = 'blsjd';
  Alert(
    title: "select",
    context: context,
    style: AlertStyle(
        backgroundColor: Colors.white,
        titleStyle: titleStyle2,
    ),
    buttons: [
      DialogButton(
          color: Colors.white.withOpacity(0.3),
          child: Text("Cancel",style: titleStyle2,),
          onPressed: (){
            Navigator.of(context).pop(true);
          }),
    ],
    content: Container(
      height: height*(2/5),
      width: width,
      child: ListView.builder(
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                country = items[index];
                Navigator.of(context).pop(true);
              },
              title: Text("${items[index]}",style: textStyle,),
            );
          }
      ),
    ),
  )..show();
  return country;
}