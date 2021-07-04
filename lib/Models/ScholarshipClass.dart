
class ScholarshipGnClass{
  String id;
  String amount;
  String apply_link;
  String official_web;
  String deadline;
  bool isTopScholar;
  String year;
  List images;
  String duration;

  //////////////// English /////////////

  String advantage_en;
  String condition_en;
  String description_en;
  String name_en;
  String other_detail_en;
  String how_to_apply_en;
  String req_docs_en;
  String country_en;
  List eligible_en;
  List level_en;

  ////////////////// French //////////////

  String advantage_fr;
  String condition_fr;
  String description_fr;
  String name_fr;
  String other_detail_fr;
  String how_to_apply_fr;
  String req_docs_fr;
  String country_fr;
  List eligible_fr;
  List level_fr;


  ScholarshipGnClass({
    required this.id,
    required this.amount,
    required this.apply_link,
    required this.images,
    required this.year,
    required this.deadline,
    required this.isTopScholar,
    required this.official_web,
    required this.duration,
    /// english
    required this.advantage_en,
    required this.condition_en,
    required this.country_en,
    required this.eligible_en,
    required this.description_en,
    required this.how_to_apply_en,
    required this.level_en,
    required this.name_en,
    required this.other_detail_en,
    required this.req_docs_en,
    /// french
    required this.advantage_fr,
    required this.condition_fr,
    required this.country_fr,
    required this.eligible_fr,
    required this.description_fr,
    required this.how_to_apply_fr,
    required this.level_fr,
    required this.name_fr,
    required this.other_detail_fr,
    required this.req_docs_fr

  });
}
