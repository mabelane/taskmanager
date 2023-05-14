import 'package:sqflite/sqflite.dart';

import '../../model/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableTask = "Task";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }

    try {
      String path = "${await getDatabasesPath()}notes.db";
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        return db.execute("CREATE TABLE $_tableTask("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING, note TEXT, date STRING,"
            "startTime STRING, endTime STRING,"
            "flag INTEGER, priority STRING,"
            "remind INTEGER,"
            "colour INTEGER, done INTEGER)");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableTask, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableTask);
  }

  static deleteTask(Task task) async {
    return await _db!.delete(_tableTask, where: "id=?", whereArgs: [task.id]);
  }
}
