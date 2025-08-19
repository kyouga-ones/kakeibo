import 'package:sqflite/sqflite.dart';

Future<Database> connectDatabase(String dbPath) async {
  var db = await databaseFactory.openDatabase(dbPath);

  return db;
}
