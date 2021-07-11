

import 'package:intl/intl.dart';

String getDate(){
  DateTime _time = DateTime.now();
  var formatDate = DateFormat('yyyy-MM-dd');
  String date = formatDate.format(_time);
  return date;
}