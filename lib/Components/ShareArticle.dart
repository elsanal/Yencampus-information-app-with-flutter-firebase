
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

// class SharePost extends StatefulWidget {
//   String name;
//   String country;
//   String level;
//   String advantage;
//   String description;
//   String file;
//   SharePost({this.name,this.country,this.level, this.description,this.advantage, this.file});
//   @override
//   _SharePostState createState() => _SharePostState();
// }
//
// class _SharePostState extends State<SharePost> {
//
//   _sharePost(String name,String country,String level, String description,String advantage, String file)async{
//     String campusapp = 'https://play.google.com/store/apps/details?id=com.bigfaso.campus';
//     try{
//       await FlutterShare.share(
//         title: "Campus+, l'application qui donne des informations sur les bourses,"
//             "les universités, les Jobs et bien d'autres informations.",
//         text:name + '\n\n'+
//             'Pays : ' + country + '\n\n' +
//             'Niveau : ' + level +'\n\n'+
//             description + "\n"+
//             advantage + "\n"
//             + "Site web officiel : \n" + file + "\n\n"
//             + "Telechargez Campus+ pour voir plus de bourses disponibles : ",
//         linkUrl: campusapp,
//       );
//     }catch(e){
//       print('error : $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 40),
//       child: Column(
//         children: [
//           FloatingActionButton(
//             onPressed:(){
//               _sharePost(widget.name,widget.country,widget.level, widget.description,widget.advantage, widget.file);
//             },
//             tooltip: "Partagez",
//             backgroundColor: Colors.green,
//             elevation: 10,
//             child: Text("Partagez", style: TextStyle(
//                 fontSize: 10,
//                 color: Colors.white
//             ),),
//           ),
//         ],
//       ),
//     );
//   }
// }



