import 'package:ilapz_test/models/user.dart';
import 'package:ilapz_test/utils/Constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('users.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';

    await db.execute('''
CREATE TABLE $tableUsers ( 
  ${UserFields.id} $idType, 
  ${UserFields.name} $textType,
  ${UserFields.username} $textType,
  ${UserFields.email} $textType,
  ${UserFields.profile_image} $textType,
  ${UserFields.address} $textType,
  ${UserFields.phone} $textType,
  ${UserFields.website} $textType,
  ${UserFields.company} $textType
  )
''');



  }

  Future<UsersList> create(UsersList user) async {

    //await instance.deleteTableUser();
    final db = await instance.database;


    final id = await db.insert(tableUsers, user.toJson());

    return user.copy(id: id);
  }






  Future<List<UsersList>> readAllUsers() async {
    final db = await instance.database;


     final result = await db.rawQuery('SELECT * FROM $tableUsers');

    //final result = await db.query(tableQuestions, orderBy: orderBy);

    return result.map((json) => UsersList.fromJson(json)).toList();
  }






  Future<int> deleteTableUser() async {
    final db = await instance.database;


    return await db.delete(
      tableUsers
    );
  }







  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
