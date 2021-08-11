class UniversityClass{
  String id;
  String school_fee;
  String app_fee;
  String apply_link;
  String official_web;
  String deadline;
  int world_ranking;
  int national_ranking;
  bool isTopUniversity;
  bool isOpen;
  bool isPublic;
  List images;
  String description;
  String name;
  String country;
  String city;
  List major;

  UniversityClass({
    required this.id,
    required this.apply_link,
    required this.images,
    required this.deadline,
    required this.school_fee,
    required this.isTopUniversity,
    required this.official_web,
    required this.city,
    required this.isOpen,
    required this.isPublic,
    required this.national_ranking,
    required this.world_ranking,
    required this.app_fee,
    /// english
    required this.country,
    required this.description,
    required this.name,
    required this.major,
  });
}
