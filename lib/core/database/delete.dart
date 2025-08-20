import 'package:sqflite/sqflite.dart';

Future delete(
  Database db,
  int id,
) {
  return db.delete(
    'transaction_table',
    where: 'id = ?',
    whereArgs: [id],
  );
}
