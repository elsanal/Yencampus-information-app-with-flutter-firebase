import 'package:yencampus/Function/Date.dart';

switchItem(String item){
  String _selected = '';
  String _target = '';
  print(item);
  switch(item){
    case "most_recent":
      _selected = getDate();
      _target = "deadline";
      break;
    case "popular_scholar":
      _selected = "true";
      _target = "isTopScholar";
      break;
    case "popular_univ":
      _selected = "true";
      _target = "isTopUniv";
      break;
    case "full_funded":
      _selected = "true";
      _target = "isFull";
      break;
    case "part_funded":
      _selected = "false";
      _target = "isFull";
      break;
    case "deadline":
      _selected = getDate();
      _target = "deadline";
      break;
    case "free_tuition":
      _selected = "free";
      _target = "school_fee";
      break;
    case "isOpen":
      _selected = "true";
      _target = "isOpen";
      break;
    case "isOpenn":
      _selected = "true";
      _target = "isOpen";
      break;
    case "low_cost":
      _selected = "true";
      _target = "isLowCost";
      break;
    case "private":
      _selected = "false";
      _target = "isPublic";
      break;
    case "privatee":
      _selected = "false";
      _target = "isPublic";
      break;
    case "public":
      _selected = "true";
      _target = "isPublic";
      break;
    case "publicc":
      _selected = "true";
      _target = "isPublic";
      break;
    case "all":
      _selected = "";
      break;
  }
  return [_selected,_target];
}