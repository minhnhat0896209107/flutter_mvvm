import 'package:flutter_app/src/resource/database/database.dart';

class CreateDBNote {
  Future createDBNote() async {
    var dbClient = await SqliteDB().db;
    var res = await dbClient!.execute("""
      CREATE TABLE Note(
        id TEXT PRIMARY KEY,
        title TEXT,
        date DATETIME,
        name TEXT
      )
    """);
    return res;
  }
}
