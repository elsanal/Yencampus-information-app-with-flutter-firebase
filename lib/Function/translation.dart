import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


translate(BuildContext context,String item){
  String _selected = '';
  switch(item){
    case "all":
      _selected = AppLocalizations.of(context)!.all;
      break;
    case "advantage":
      _selected = AppLocalizations.of(context)!.advantage;
      break;
    case "amount":
      _selected = AppLocalizations.of(context)!.amount;
      break;
    case "apply":
      _selected = AppLocalizations.of(context)!.apply;
      break;
    case "av_job":
      _selected = AppLocalizations.of(context)!.av_job;
      break;
    case "av_scholar":
      _selected = AppLocalizations.of(context)!.av_scholar;
      break;
    case "carer":
      _selected = AppLocalizations.of(context)!.carer;
      break;
    case "carer_of_future":
      _selected = AppLocalizations.of(context)!.carer_of_future;
      break;
    case "category":
      _selected = AppLocalizations.of(context)!.category;
      break;
    case "condition":
      _selected = AppLocalizations.of(context)!.condition;
      break;
    case "country":
      _selected = AppLocalizations.of(context)!.country;
      break;
    case "deadline":
      _selected = AppLocalizations.of(context)!.deadline;
      break;
    case "delete":
      _selected = AppLocalizations.of(context)!.delete;
      break;
    case "deleted":
      _selected = AppLocalizations.of(context)!.deleted;
      break;
    case "depart_majors":
    _selected = AppLocalizations.of(context)!.depart_majors;
    break;
    case "disadvantage":
      _selected = AppLocalizations.of(context)!.disadvantage;
      break;
    case "document":
      _selected = AppLocalizations.of(context)!.document;
      break;
    case "domain":
      _selected = AppLocalizations.of(context)!.domain;
      break;
    case "duration":
      _selected = AppLocalizations.of(context)!.duration;
      break;
    case "disco_carer":
      _selected = AppLocalizations.of(context)!.disco_carer;
      break;
    case "eligible":
      _selected = AppLocalizations.of(context)!.eligible;
      break;
    case "email":
      _selected = AppLocalizations.of(context)!.email;
      break;
    case "enterprise":
      _selected = AppLocalizations.of(context)!.enterprise;
      break;
    case "free":
      _selected = AppLocalizations.of(context)!.free;
      break;
    case "free_univ":
      _selected = AppLocalizations.of(context)!.free_univ;
      break;
    case "free_tuition":
      _selected = AppLocalizations.of(context)!.free_tuition;
      break;
    case "full_funded":
      _selected = AppLocalizations.of(context)!.full_funded;
      break;
    case "home":
      _selected = AppLocalizations.of(context)!.home;
      break;
    case "how_apply":
      _selected = AppLocalizations.of(context)!.how_apply;
      break;
    case "how_major":
      _selected = AppLocalizations.of(context)!.how_major;
      break;
    case "how_scholar":
    _selected = AppLocalizations.of(context)!.how_scholar;
      break;
    case "how_univ":
    _selected = AppLocalizations.of(context)!.how_univ;
      break;
    case "level":
      _selected = AppLocalizations.of(context)!.level;
      break;
    case "more":
      _selected = AppLocalizations.of(context)!.more;
      break;
    case "most_popular":
      _selected = AppLocalizations.of(context)!.most_popular;
      break;
    case "most_recent":
      _selected = AppLocalizations.of(context)!.most_recent;
      break;
    case "nb_of_place":
      _selected = AppLocalizations.of(context)!.nb_of_place;
      break;
    case "univ":
      _selected = AppLocalizations.of(context)!.univ;
      break;
    case "job":
      _selected = AppLocalizations.of(context)!.job;
      break;
    case "part_funded":
      _selected = AppLocalizations.of(context)!.part_funded;
      break;
    case "popular":
    _selected = AppLocalizations.of(context)!.popular;
      break;
    case "read_more":
      _selected = AppLocalizations.of(context)!.read_more;
      break;
    case "req":
      _selected = AppLocalizations.of(context)!.req;
      break;
    case "save":
      _selected = AppLocalizations.of(context)!.save;
      break;
    case "saved":
      _selected = AppLocalizations.of(context)!.saved;
      break;
    case "salary":
      _selected = AppLocalizations.of(context)!.salary;
      break;
    case "scholar":
      _selected = AppLocalizations.of(context)!.scholar;
      break;
    case "scholar_myth":
      _selected = AppLocalizations.of(context)!.scholar_myth;
      break;
    case "school_fee":
    _selected = AppLocalizations.of(context)!.school_fee;
    break;
    case "share":
    _selected = AppLocalizations.of(context)!.share;
    break;
    case "search":
      _selected = AppLocalizations.of(context)!.search;
      break;
    case "some_tip":
      _selected = AppLocalizations.of(context)!.some_tip;
      break;
    case "tel":
      _selected = AppLocalizations.of(context)!.tel;
      break;
    case "tip":
      _selected = AppLocalizations.of(context)!.tip;
      break;
    case "trend":
      _selected = AppLocalizations.of(context)!.trend;
      break;
    case "type":
      _selected = AppLocalizations.of(context)!.type;
      break;
    case "type_contract":
      _selected = AppLocalizations.of(context)!.type_contract;
      break;
    case "web":
      _selected = AppLocalizations.of(context)!.web;
      break;
    case "work_place":
    _selected = AppLocalizations.of(context)!.job;
      break;
    default:
      _selected = item;

  }
  return _selected;
}