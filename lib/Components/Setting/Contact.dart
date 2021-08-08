import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Function/urlLauncher.dart';

Contact(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  Alert(
    title: translate(context, "Contacts"),
    context: context,
    style: AlertStyle(
      backgroundColor: Colors.grey[300],
      titleStyle: titleStyle2.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(80)
      ),
    ),
    buttons: [
      DialogButton(
          color: Colors.red.withOpacity(0.3),
          child: Text("Okay",style: titleStyle2,),
          onPressed: (){
            Navigator.of(context).pop(true);
          }),
    ],
    content: Container(
        height: height*(2.8/5),
        width: width,
        child:ListView.builder(
            itemCount: _social.length,
            itemBuilder:(context,index){
              var item = _social[index];
              return Container(
                margin: EdgeInsets.all(6),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: ListTile(
                  onTap: (){
                    if(item['name']=='gmail'){
                      _sendEmail(context, item['ulr']!);
                    }else{
                      _socialUlr(context, item['url']!);
                    }
                    Navigator.of(context).pop(true);
                  },
                  tileColor: Colors.black87,
                  leading: CircleAvatar(
                    radius: ScreenUtil().setWidth(100),
                    child: Image.asset(item['icon']!),
                  ),
                  title: Text(item['name']!, style: titleStyle.copyWith(
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.bold
                  ),),
                ),
              );
            }
        )
    ),
  )..show();
}

var _social = [
  {"name":"Facebook","icon":"assets/social/facebook.png",
    "url":"https://www.facebook.com/ElsonXcode/"},
  {"name":"Youtube","icon":"assets/social/youtube.png",
    "url":"https://www.youtube.com/channel/UCznjjnUE9kvHlg_pBobDm5Q/playlists"},
  {"name":"Instagram","icon":"assets/social/instagram.jpg",
    "url":"https://www.instagram.com/invites/contact/?i=1jiyq71lok1zw&utm_content=lk3c9oi"},
  {"name":"yentech.corp@gmail.com","icon":"assets/social/gmail.png",
    "url":"yentech.corp@gmail.com"},
  {"name":"WhatsApp","icon":"assets/social/whatsapp.png",
    "url":"https://chat.whatsapp.com/Hes9l5bH5Vg2xxFwU1mTBJ"},
];

_socialUlr(BuildContext context,String url)async{
  final snackBar = SnackBar(
    content: Text("Can't open the website..."),);
  final waitSnackBar = SnackBar(
    content: Text("Waiting..."),);
  ScaffoldMessenger.of(context).showSnackBar(waitSnackBar);
  await canLaunch(url)?launch(url):ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

_sendEmail(BuildContext context,String url)async{
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: "$url",
    query: encodeQueryParameters(<String, String>{
      'subject': translate(context, "scholar") + ' - ' +
                 translate(context, "univ")
    }),
  );
  final snackBar = SnackBar(
    content: Text("Can't open the mailbox..."),);
  final waitSnackBar = SnackBar(
    content: Text("Waiting..."),);
  ScaffoldMessenger.of(context).showSnackBar(waitSnackBar);
  await canLaunch(emailLaunchUri.toString())?launch(emailLaunchUri.toString()):ScaffoldMessenger.of(context).showSnackBar(snackBar);
}