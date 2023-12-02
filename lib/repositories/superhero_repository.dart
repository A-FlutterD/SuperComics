
import 'package:sqflite/sqflite.dart';
import 'package:super_comics_app/databases/superheroe_database.dart';
import 'package:super_comics_app/models/superhero.dart';


class SuperheroRepository {
  Future insert(Superhero superhero) async {
    Database db = await SuperheroeDatabase().openDb();
    db.insert(SuperheroeDatabase().tableName, superhero.toMap());
  }

  Future delete(String id) async {
    Database db = await SuperheroeDatabase().openDb();
    db.delete(SuperheroeDatabase().tableName, where: 'id =?', whereArgs: [id]);
  }

  Future<bool> isFavorite(Superhero superhero) async {
    Database db = await SuperheroeDatabase().openDb();
    final maps = await db.query(SuperheroeDatabase().tableName, where: 'id =?', whereArgs: [superhero.id]);
    return maps.isNotEmpty;
  }

  Future update(Superhero superhero) async {
    Database db = await SuperheroeDatabase().openDb();
    db.update(SuperheroeDatabase().tableName, superhero.toMap(), where: 'id =?', whereArgs: [superhero.id]);
  }

  Future<List<Superhero>> getAll() async {
    Database db = await SuperheroeDatabase().openDb();
    final maps = await db.query(SuperheroeDatabase().tableName);
    return maps.map((map) => Superhero.fromMap(map)).toList();
  }

  Future<int?> getCount() async {
    Database db = await SuperheroeDatabase().openDb();
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ${SuperheroeDatabase().tableName}'));
  }

}
