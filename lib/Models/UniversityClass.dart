

class UniversityClass{
  String id;
  String school_fee;
  String apply_link;
  String official_web;
  String deadline;
  bool isTopUniversity;
  List images;


  //////////////// English /////////////

  String description;
  String name;
  String country;
  List major;



  UniversityClass({
    required this.id,
    required this.apply_link,
    required this.images,
    required this.deadline,
    required this.school_fee,
    required this.isTopUniversity,
    required this.official_web,
    /// english
    required this.country,
    required this.description,
    required this.name,
    required this.major,


  });
}
