import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



TextStyle titleStyle = GoogleFonts.comfortaa(
  fontSize: ScreenUtil().setSp(100),
  fontWeight: FontWeight.w900,
  color: Colors.black,
);

TextStyle titleStyle2 = GoogleFonts.comfortaa(
  fontSize: ScreenUtil().setSp(80),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle textStyle = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(45),
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

Map<String, Style> bodyStyle = {
  "table": Style(backgroundColor: Colors.black),
  "p": Style(
    fontSize: FontSize(ScreenUtil().setSp(45)),
    fontWeight: FontWeight.w600,
    color: Colors.black,),
  "li": Style(
    fontSize: FontSize(ScreenUtil().setSp(45)),
    fontWeight: FontWeight.w400,
    color: Colors.black,),
  "ul": Style(
    fontSize: FontSize(ScreenUtil().setSp(45)),
    fontWeight: FontWeight.w600,
    color: Colors.black,),
};
