
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

  String advantage;
  String condition;
  String description;
  String name;
  String other_detail;
  String how_to_apply;
  String req_docs;
  String country;
  List eligible;
  List level;

  ////////////////// French //////////////



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
    required this.advantage,
    required this.condition,
    required this.country,
    required this.eligible,
    required this.description,
    required this.how_to_apply,
    required this.level,
    required this.name,
    required this.other_detail,
    required this.req_docs,



  });
}
