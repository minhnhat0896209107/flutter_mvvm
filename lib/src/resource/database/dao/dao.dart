import 'package:flutter_app/src/resource/database/database.dart';

class Dao {
  insertNoteBook(newImage) async {
    final db = await SqliteDB().db;
    var res = await db!.rawInsert("""
      INSERT INTO images(
        image, name
      ) VALUES(?, ?)
    """, [newImage.image, newImage.name]);
    return res;
  }

  insertNote(newNote) async {
    final db = await SqliteDB().db;
    var res = await db!.rawInsert("""
    INSERT INTO notes(
      title, date, name
    )VALUES()
    """);
    return res;
  }

  // Future<dynamic> getNoteBook() async {
  //   final db = await SqliteDB().db;
  //   var res = await db!.query("image");
  //   if (res.length == 0) {
  //     return null;
  //   } else {
  //     var resMap = res[0];
  //     return resMap.isNotEmpty ? resMap : Null;
  //   }
  // }
}
