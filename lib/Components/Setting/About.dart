import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/translation.dart';



About(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  String lang = getLocale(context);
  Alert(
    title: translate(context, "about"),
    context: context,
    style: AlertStyle(
      backgroundColor: Colors.white,
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
      height: height*(2/5),
      width: width,
      child: SingleChildScrollView(
        child: Text(lang=="fr"?_about['fr']![0]:_about['en']![0],
        style: textStyle,
          textAlign: TextAlign.justify,
        ),
      )
    ),
  )..show();
}

var _about= {
  "fr":["Campus+ est une plateforme d'information. ""Cette plateforme est mise en "
      "place pour simplifier la vie des étudiants,"
      "élèves et chercheurs d'emplois.""Elle publie des "
      "informations concernant les bourses d'études, les universités,"
      " les offres d'emplois, les strategies pour avoir des admissions des "
      "admissions dans les universités internationales notamment en "
      "au Canada, aux USA, en Chine, en France, en Afrique du Sud, "
      "au Maroc, au Rwanda, et pleins d'autres pays. Elle travaille en "
      "étroit collaboration avec certaines universités et institutions "
      "pour vous donner des informations de qualités.\n\n"
       "Toutes les annonces de bourses, d'admission à l'université, "
      "ou d'offre d'emplois sont totalement gratuites. Nous ne prenons "
      "pas d'argent avec quelqu'un en échange d'une admission. Vous devrez "
      "suivre les procédures vous même ou se faire aider pour un ami ou "
      "un proche qui connait comment faire. "],
  "en":["Campus + is an information platform."
      "This platform is set up to make life easier for "
      "students and job seekers." "It publishes"
      "information concerning scholarships, universities,"
      "job offers, strategies for getting admissions "
      "to international universities, particularly in"
      "in Canada, in the USA, in China, in France, in South Africa,"
      "in Morocco, Rwanda, and many other countries. It works in"
      "close collaboration with certain universities and institutions"
      "to give you quality information. \n\n"
      "All scholarship, university admission announcements,"
      "or job offer are completely free. We don't take"
      " money with someone in exchange for admission. You will have to"
      "follow the procedures yourself or get helped by a friend or"
      " a someone else who knows how to do it."]
};