class JobClass{
  String id;
  String duration;
  String apply_link;
  String official_web;
  String deadline;
  String salary;
  List images;


  //////////////// English /////////////
  String description;
  String name;
  String country;
  String required;

  JobClass({
    required this.id,
    required this.apply_link,
    required this.images,
    required this.deadline,
    required this.official_web,
    required this.salary,
    required this.duration,
    /// english
    required this.country,
    required this.description,
    required this.name,
    required this.required,


  });
}