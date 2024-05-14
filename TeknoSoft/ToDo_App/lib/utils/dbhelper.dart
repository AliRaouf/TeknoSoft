import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

class DBHelper {
  static const _dbName = "todo";
  static const _tableName ='task';


  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName), version: 1,
      onCreate: (db, version) {
        db.execute(
            'create table $_tableName(id integer primary key autoincrement,name text not null,time text not null,type text not null,favorite text not null,status text not null)');
      },);
    return database;
  }

  static insertPerson(Todo task) async {
    final db = await _database();
    db.insert(_tableName, task.toMap());
  }
  static updatePerson(Todo task) async {
    final db = await _database();
    db.update(_tableName, task.toMap(), where: 'id = ?',
        whereArgs: [task.id]);
  }
  static deletePerson(Todo task) async {
    final db = await _database();
    db.delete(_tableName, where: 'id = ?',
        whereArgs: [task.id ]);
  }
  static Future<List<Todo>> getTasks() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (index) {
      return
        Todo(id: maps[index]['id'], name: '', time: '', type: '', favorite: '', status: '');
    });
  }
}