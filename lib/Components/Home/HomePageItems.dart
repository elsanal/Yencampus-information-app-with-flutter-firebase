import 'package:flutter/material.dart';
import 'package:yencampus/Components/Loading.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/CarerClass.dart';
import 'package:yencampus/Models/JobClass.dart';
import 'package:yencampus/Models/ScholarshipClass.dart';
import 'package:yencampus/Components/Home/HomeAppBar.dart';
import 'package:yencampus/Models/UniversityClass.dart';
import 'HomePageContent.dart';


 homePageItems(BuildContext context, String cat,final data, String type) {
   var w = MediaQuery
       .of(context)
       .size
       .width;

   switch (type) {
     case "scholar":
       return FutureBuilder<List<ScholarshipGnClass>>(
           future: data,
           builder: (context, snapshot) {
             if (!snapshot.hasData) {
               return Loading();
             } else if (snapshot.hasError) {
               return Center(child: Text(translate(context,"error")),);
             } else {
               List<ScholarshipGnClass> docs = snapshot.data!;
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   docs.length > 0 ? category(cat) : Container(),
                   Container(
                     height: w * (2 / 3),
                     width: w,
                     child: homepageContent(context, docs, "scholar"),
                   ),
                 ],
               );
             }
           }
       );
     case "univ" :
       return FutureBuilder<List<UniversityClass>>(
           future: data,
           builder: (context, snapshot) {
             if (!snapshot.hasData) {
               return Container();
             } else if (snapshot.hasError) {
               return Center(child: Text(translate(context,"error")),);
             } else {
               List<UniversityClass> docs = snapshot.data!;
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   docs.length > 0 ? category(cat) : Container(),
                   Container(
                     height: w * (2 / 3),
                     width: w,
                     child: homepageContent(context, docs, "univ"),
                   ),
                 ],
               );
             }
           }
       );
     case "job" :
       {
         return FutureBuilder<List<JobClass>>(
             future: data,
             builder: (context, snapshot) {
               if (!snapshot.hasData) {
                 return Container();
               } else if (snapshot.hasError) {
                 return Center(child: Text(translate(context,"error")),);
               } else {
                 List<JobClass> docs = snapshot.data!;
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     docs.length > 0 ? category(cat) : Container(),
                     Container(
                       height: w * (2 / 3),
                       width: w,
                       child: homepageContent(context, docs, "job"),
                     ),
                   ],
                 );
               }
             }
         );
       }
     case "carer":
       {
         return FutureBuilder<List<CarerClass>>(
             future: data,
             builder: (context, snapshot) {
               if (!snapshot.hasData) {
                 return Container();
               } else if (snapshot.hasError) {
                 return Center(child: Text(translate(context,"error")),);
               } else {
                 List<CarerClass> docs = snapshot.data!;
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     docs.length > 0 ? category(cat) : Container(),
                     Container(
                       height: w * (2 / 3),
                       width: w,
                       child: homepageContent(context, docs, "carer"),
                     ),
                   ],
                 );
               }
             }
         );
       }
   }
 }



