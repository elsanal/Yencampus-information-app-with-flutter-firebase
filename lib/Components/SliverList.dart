import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Decoration/Fonts.dart';

// Widget sliverList(BuildContext context){
//   return SliverList(
//       delegate: SliverChildBuilderDelegate(
//           (context, int index){
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(ScreenUtil().setWidth(30)),
//                   topRight: Radius.circular(ScreenUtil().setWidth(30)),
//                 )
//               ),
//               child: ListTile(
//                 title: Text("Idem $index"),
//               ),
//             );
//           },
//         childCount: 20,
//         addAutomaticKeepAlives: true,
//         addRepaintBoundaries: true,
//       ),
//   );
// }

Widget homepageContent(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return GridView.builder(
    scrollDirection: Axis.horizontal,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 1.1,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10
    ),
    itemCount: 5,
    itemBuilder: (context,index)=>Card(
      elevation: 5,
      shadowColor: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Container(child: Image.asset(
              "assets/hat$index.jpeg",
            fit: BoxFit.fill,
          ),),
          new Container(
            margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
            color: Colors.grey[400],height: 1,width: width*(3/5),),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: new Text("The most wanted scholarship. Chinese Government Scholarship "
                  "is open now. i am going to apply for it."
                  "The most wanted scholarship. Chinese Government Scholarship"
              "is open now. i am going to apply for it.",style: textStyle,
                maxLines:4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // new Container(height: 3,)
        ],
      ),
    )
  );
}