class JobClass{
  String id;
  String duration;
  String apply_link;
  String official_web;
  String deadline;
  String salary;
  List images;


  //////////////// English /////////////


  String description_en;
  String name_en;
  String country_en;
  String required_en;

  ////////////////// French //////////////
  String description_fr;
  String name_fr;
  String country_fr;
  String required_fr;



  JobClass({
    required this.id,
    required this.apply_link,
    required this.images,
    required this.deadline,
    required this.official_web,
    required this.salary,
    required this.duration,
    /// english
    required this.country_en,
    required this.description_en,
    required this.name_en,
    required this.required_en,
    /// french
    required this.country_fr,
    required this.description_fr,
    required this.name_fr,
    required this.required_fr,

  });
}