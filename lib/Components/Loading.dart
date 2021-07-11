import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
        width: width,
        height: width,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50))
            ),
            child: SpinKitCircle(color: Colors.black45,),
          ),
        ),
      ),
    );
  }
}
