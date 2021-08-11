import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yencampus/Models/SavedClass.dart';


// ignore: camel_case_types
class localDB{

  String  tableName;
  late Database db ;
  localDB({required this.tableName});

  init(int delay)async{
    db = await Future.delayed(Duration(milliseconds: delay), ()=>database());
    return db;
  }

////// create a table
  Future<Database> database()async{
    return openDatabase(
      join(await getDatabasesPath(),"YENCAMPUS"),
      onCreate: (Database dB, int version){
        print("created");
        return dB.execute("CREATE TABLE $tableName("
            "id TEXT,"
            "type TEXT"
            ")");
      },
      version: 1,
    );
  }

  /// Save the new score to the database
  Future saveOndB(SavePost post)async{
    var req = await init(500);
    req.insert('$tableName', post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,);
    print("Saved on $tableName");
    return true;
  }

  /// Restore all the score in stored in the table
  Future<List<SavePost>> readFromDB()async{
    var request  = await init(500);
    List<SavePost> posts = [];
    List<Map<String, dynamic>> list = await request.query('$tableName');
    list.forEach((post) {
      SavePost _post = SavePost.fromJson(post);
      posts.add(_post);
    });
    print("Got data from table : $tableName");
    return posts;
  }
  delete(int id)async{
    var request  = await init(500);
     await request.delete('$tableName',where:"id = ?",whereArgs:[id]);
    print("Deleted");
  }
}