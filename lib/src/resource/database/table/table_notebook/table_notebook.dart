import 'package:flutter_app/src/resource/database/database.dart';

class CreateDBNotebook {
  Future createDBNotebook() async {
    var dbClient = await SqliteDB().db;
    var res = await dbClient!.execute("""
      CREATE TABLE Notebook(
        id TEXT PRIMARY KEY,
        image STRING,
        name TEXT
      )""");
    return res;
  }
}
