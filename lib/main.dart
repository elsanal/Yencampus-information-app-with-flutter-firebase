
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:yencampus/Pages/Homepage.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YenCampus());
}

class YenCampus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.black,
    ));
    return ScreenUtilInit(
      designSize: Size(1080,1920),
      builder:()=>MaterialApp(
        title: 'YenCampus+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage()
      ),
    );
  }
}
