import 'package:flutter/material.dart';

getLocale(BuildContext context){
  Locale myLocale = Localizations.localeOf(context);
  var lang = myLocale.toString();
  print(myLocale);
  return lang;
}
