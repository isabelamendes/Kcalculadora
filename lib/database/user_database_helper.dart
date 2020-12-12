import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:kcalculadora/database/models.dart';

class UserDatabaseHelper {

  static final _dbName = "kcalculadora.db";
  static final _dbVersion = 1; 

  static final _tableName = "users";
  static final colId = "id";
  static final colEmail = "email";
  static final colPassword = "password";
  

  UserDatabaseHelper._privateConstructor();
  static final UserDatabaseHelper userHelper = UserDatabaseHelper._privateConstructor();

  static Database _database;

    Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initiateDatabase();

    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute(
      '''
      CREATE TABLE IF NOT EXISTS $_tableName(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $colEmail VARCHAR(100), 
        $colPassword VARCHAR(100)
      )
      '''
    );
  }

  Future<int> insert(User user) async {
    Database db = await userHelper.database;
    return await db.insert(_tableName, user.toMap());
  }

 
  Future<List<User>> queryAll() async {
    Database db = await userHelper.database;
    var userMapList = await db.query(_tableName);
    List<User> users = new List<User>();
    for(int i = 0; i < userMapList.length; i++) {
      users.add(User.fromMap(userMapList[i]));
    }
    return users;
  }

  Future<int> deleteAll() async {
    Database db = await userHelper.database;
    return await db.rawDelete("DELETE FROM $_tableName");
  }

}