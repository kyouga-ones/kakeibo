import 'package:kakeibo/core/database/create_table_if_not_exists.dart';
import 'package:sqflite/sqflite.dart';

Future insert(
  Database db,
  int categoryType,
  int category,
  DateTime? date,
  int paymentCategory,
  int value,
) async {
  await createTableIfNotExists(db);

  await db.rawInsert(
    'INSERT INTO transaction_table (category_type, category, date, payment_category, value) VALUES ( ?, ?, ?, ?, ?);',
    [
      categoryType,
      category,
      date.toString(),
      paymentCategory,
      value,
    ],
  );
}
