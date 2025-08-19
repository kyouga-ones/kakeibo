import 'package:kakeibo/core/database/create_table_if_not_exists.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

Future<Map<int, TransactionModel>> select(
  Database db,
) async {
  createTableIfNotExists(db);

  final List<Map<String, dynamic>> resultList = await db.query(
    'transaction_table',
  );

  Map<int, TransactionModel> transactionMap = {};
  for (final result in resultList) {
    transactionMap[result['id']] = TransactionModel(
      categoryType: result['category_type'],
      category: result['category'],
      date: DateTime.parse(result['date']).toLocal(),
      paymentCategory: result['payment_category'],
      value: result['value'],
    );
  }
  return transactionMap;
}
