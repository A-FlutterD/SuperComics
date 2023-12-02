import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SuperheroeDatabase {
  final int version = 1;
  final String databaseName ='superheroes.db';
  final String tableName ='superheroes';

  Database? database;

  Future<Database> openDb() async {
    database ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (database, version) {
        database.execute(
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY, name TEXT, image TEXT, gender TEXT, intelligence TEXT)',
        );
      },
      version: version,
    );
    return database as Database;
  }

}