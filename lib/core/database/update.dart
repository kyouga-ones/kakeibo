import 'package:sqflite/sqflite.dart';

Future update(
  Database db,
  int id,
  int categoryType,
  int category,
  DateTime date,
  int paymentCategory,
  int value,
) {
  return db.rawUpdate(
    'UPDATE transaction_table SET category_type = ?, category = ?, date = ?, payment_category = ?, value = ? WHERE id = ?',
    [
      categoryType,
      category,
      date.toString(),
      paymentCategory,
      value,
      id,
    ],
  );
}
