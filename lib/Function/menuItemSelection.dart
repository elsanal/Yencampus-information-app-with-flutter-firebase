

import 'package:yencampus/Function/Date.dart';

switchItem(String item){
  String _selected = '';
  String _target = '';
  switch(item){
    case "most_recent":
      _selected = getDate();
      _target = "deadline";
      break;
    case "most_popular":
      _selected = "true";
      _target = "isTopScholar";
      break;
    case "popular":
      _selected = "true";
      _target = "isTopUniv";
      break;
    case "full_funded":
      _selected = "Full funded";
      _target = "amount";
      break;
    case "part_funded":
      _selected = "Partially funded";
      _target = "amount";
      break;
    case "deadline":
      _selected = getDate();
      _target = "deadline";
      break;
    case "free_tuition":
      _selected = "free";
      _target = "school_fee";
      break;
    case "all":
      _selected = "";
      break;
  }
  return [_selected,_target];
}