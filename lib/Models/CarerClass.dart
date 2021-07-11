class CarerClass{
  String id;
  List images;

  //////////////// English /////////////
  String description_en;
  String name_en;
  String advantage_en;
  String disadvantage_en;

  ////////////////// French //////////////
  String description_fr;
  String name_fr;
  String advantage_fr;
  String disadvantage_fr;



  CarerClass({
    required this.id,
    required this.images,
    /// english
    required this.description_en,
    required this.name_en,
    required this.advantage_en,
    required this.disadvantage_en,
    /// french
    required this.advantage_fr,
    required this.description_fr,
    required this.name_fr,
    required this.disadvantage_fr,

  });
}