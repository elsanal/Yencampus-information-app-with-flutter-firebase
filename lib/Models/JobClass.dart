class JobClass{
  String id;
  String duration;
  String apply_link;
  String official_web;
  String deadline;
  String salary;
  List images;
  bool isOpen;
  List contrat_type;
  String experience;
  String nb_poste;
  String enterprise;

  //////////////// English /////////////
  String description;
  String responsibility;
  String name;
  String city;
  String email;
  String tel;
  String country;
  String required;
  List level;
  List language;
  List category;

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
    required this.responsibility,
    required this.name,
    required this.city,
    required this.tel,
    required this.email,
    required this.required,
    required this.isOpen,
    required this.contrat_type,
    required this.category,
    required this.language,
    required this.level,
    required this.experience,
    required this.nb_poste,
    required this.enterprise,
  });
}