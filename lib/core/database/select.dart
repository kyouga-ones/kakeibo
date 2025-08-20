import 'package:kakeibo/core/database/create_table_if_not_exists.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

Future<List<TransactionModel>> select(
  Database db,
) async {
  await createTableIfNotExists(db);

  final rows = await db.query('transaction_table');

  return rows.map((r) {
    return TransactionModel(
      id: r['id'] as int,
      categoryType: r['category_type'] as int,
      category: r['category'] as int,
      date: DateTime.parse(r['date'] as String).toLocal(),
      paymentCategory: r['payment_category'] as int,
      value: r['value'] as int,
    );
  }).toList();
}
