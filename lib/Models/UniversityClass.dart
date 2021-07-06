

class UniversityClass{
  String id;
  String school_fee;
  String apply_link;
  String official_web;
  String deadline;
  bool isTopUniversity;
  List images;


  //////////////// English /////////////

  String description_en;
  String name_en;
  String country_en;
  List major_en;

  ////////////////// French //////////////
  String description_fr;
  String name_fr;
  String country_fr;
  List major_fr;


  UniversityClass({
    required this.id,
    required this.apply_link,
    required this.images,
    required this.deadline,
    required this.school_fee,
    required this.isTopUniversity,
    required this.official_web,
    /// english
    required this.country_en,
    required this.description_en,
    required this.name_en,
    required this.major_en,
    /// french
    required this.country_fr,
    required this.description_fr,
    required this.name_fr,
    required this.major_fr,

  });
}
