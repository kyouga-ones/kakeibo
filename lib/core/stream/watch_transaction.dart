import 'package:kakeibo/core/database/select.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

Stream<List<TransactionModel>> watchTransactions(Database db) async* {
  while (true) {
    var list = await select(db);
    yield list;
    await Future.delayed(Duration(seconds: 1));
  }
}
