import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:proj_final_mobile/models/user.dart';

class DatabaseHelper {
  static DatabaseHelper _helper = DatabaseHelper._createInstance();
  DatabaseHelper._createInstance();

  static Database _database;

  factory DatabaseHelper() => _helper;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  String tabelaUsers = "Usuarios";
  String colId = "userId";
  String colNome = "nome";
  String colEmail = "email";
  String colUsername = "username";
  String colSenha = "password";

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "notes.db";
    var notesDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tabelaUsers ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNome TEXT, $colEmail STRING, $colUsername STRING, $colSenha STRING)");
  }

  Future<int> nextId() async {
    Database db = await this.database;
    var lastId = Sqflite.firstIntValue(await db
        .rawQuery('SELECT $colId FROM $tabelaUsers ORDER BY $colId DESC'));
    return lastId != null ? lastId + 1 : 1;
  }

  // Insert:
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert(tabelaUsers, user.toMap());
    // var result = await db.RawInsert();
    return result;
  }

  Future<List> getUsers() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $tabelaUsers');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    var result = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tabelaUsers'));
    return result;
  }

  Future<int> updateScheduling(User user) async {
    Database db = await this.database;
    var result = await db.update('Scheduling', user.toMap(),
        where: '$colId = ?', whereArgs: [user.id]);
    return result;
  }

  Future<int> deleteScheduling(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM Scheduling WHERE id = $colId');
    return result;
  }
}
