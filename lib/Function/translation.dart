import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

translate(BuildContext context,String item){
  String _selected = '';
  switch(item){
    case "about":
      _selected = AppLocalizations.of(context)!.about;
      break;
    case "all":
      _selected = AppLocalizations.of(context)!.all;
      break;
    case "app_fee":
      _selected = AppLocalizations.of(context)!.app_fee;
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
    case "available":
      _selected = AppLocalizations.of(context)!.available;
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
    case "city":
      _selected = AppLocalizations.of(context)!.city;
      break;
    case "condition":
      _selected = AppLocalizations.of(context)!.condition;
      break;
    case "country":
      _selected = AppLocalizations.of(context)!.country;
      break;
    case "contact":
      _selected = AppLocalizations.of(context)!.contact;
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
    case "disco_major":
      _selected = AppLocalizations.of(context)!.disco_major;
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
    case "enterprise_summary":
      _selected = AppLocalizations.of(context)!.enterprise_summary;
      break;
    case "experience":
      _selected = AppLocalizations.of(context)!.experience;
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
    case "info_general":
      _selected = AppLocalizations.of(context)!.info_gel;
      break;
    case "isClose":
      _selected = AppLocalizations.of(context)!.isClose;
      break;
    case "isOpen":
      _selected = AppLocalizations.of(context)!.isOpen;
      break;
    case "isOpenn":
      _selected = AppLocalizations.of(context)!.isOpenn;
      break;
    case "level":
      _selected = AppLocalizations.of(context)!.level;
      break;
    case "level_lang":
      _selected = AppLocalizations.of(context)!.level_lang;
      break;
    case "low_cost":
      _selected = AppLocalizations.of(context)!.low_cost;
      break;
    case "majors":
      _selected = AppLocalizations.of(context)!.majors;
      break;
    case "month":
      _selected = AppLocalizations.of(context)!.month;
      break;
    case "more":
      _selected = AppLocalizations.of(context)!.more;
      break;
    case "more_apps":
      _selected = AppLocalizations.of(context)!.more_apps;
      break;
    case "most_popular":
      _selected = AppLocalizations.of(context)!.most_popular;
      break;
    case "most_recent":
      _selected = AppLocalizations.of(context)!.most_recent;
      break;
    case "national_rank":
      _selected = AppLocalizations.of(context)!.national_rank;
      break;
    case "nb_of_place":
      _selected = AppLocalizations.of(context)!.nb_of_place;
      break;
    case "nb_poste":
      _selected = AppLocalizations.of(context)!.nb_of_place;
      break;
    case "next":
      _selected = AppLocalizations.of(context)!.next;
      break;
    case "univ":
      _selected = AppLocalizations.of(context)!.univ;
      break;
    case "job":
      _selected = AppLocalizations.of(context)!.job;
      break;
    case "job_type":
      _selected = AppLocalizations.of(context)!.job_type;
      break;
    case "part_funded":
      _selected = AppLocalizations.of(context)!.part_funded;
      break;
    case "popular":
    _selected = AppLocalizations.of(context)!.popular;
      break;
    case "popular_scholar":
      _selected = AppLocalizations.of(context)!.popular_scholar;
      break;
    case "popular_univ":
      _selected = AppLocalizations.of(context)!.popular_univ;
      break;
    case "public":
      _selected = AppLocalizations.of(context)!.public;
      break;
    case "publicc":
      _selected = AppLocalizations.of(context)!.publicc;
      break;
    case "public_univ":
      _selected = AppLocalizations.of(context)!.public_univ;
      break;
    case "previous":
      _selected = AppLocalizations.of(context)!.previous;
      break;
    case "private":
      _selected = AppLocalizations.of(context)!.private;
      break;
    case "privatee":
      _selected = AppLocalizations.of(context)!.privatee;
      break;
    case "qualification":
      _selected = AppLocalizations.of(context)!.qualification;
      break;
    case "read_more":
      _selected = AppLocalizations.of(context)!.read_more;
      break;
    case "responsibility":
      _selected = AppLocalizations.of(context)!.responsibility;
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
    case "state":
      _selected = AppLocalizations.of(context)!.state;
      break;
    case "std_level":
      _selected = AppLocalizations.of(context)!.std_level;
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
    case "year":
      _selected = AppLocalizations.of(context)!.year;
      break;
    case "yearr":
      _selected = AppLocalizations.of(context)!.yearr;
      break;
    case "yentech":
      _selected = AppLocalizations.of(context)!.yentech;
      break;
    case "waiting":
      _selected = AppLocalizations.of(context)!.waiting;
      break;
    case "web":
      _selected = AppLocalizations.of(context)!.web;
      break;
    case "work_place":
    _selected = AppLocalizations.of(context)!.job;
      break;
    case "world_rank":
      _selected = AppLocalizations.of(context)!.world_rank;
      break;
    default:
      _selected = item;

  }
  return _selected;
}