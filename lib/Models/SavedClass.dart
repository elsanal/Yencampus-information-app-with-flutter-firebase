class SavePost{
  String id ;
  String type ;


  SavePost({required this.type, required this.id});

  Map<String, dynamic>toMap(){
    return {
      'id':id,
      'type':type,
    };
  }

  factory SavePost.fromJson(Map<String, dynamic> map)=> new SavePost(
      id:map['id'],
      type:map['type']
  );

}