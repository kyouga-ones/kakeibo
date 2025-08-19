import 'package:sqflite/sqflite.dart';

Future createTableIfNotExists(Database db) async {
  await db.execute(
    'CREATE TABLE IF NOT EXISTS transaction_table (id INTEGER PRIMARY KEY, category_type INTEGER, category INTEGER, date TEXT, payment_category INTEGER, value INTEGER)',
  );
}
