import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/core/stream/watch_transaction.dart';
import 'package:kakeibo/my_home_page.dart';
import 'package:sqflite/sqflite.dart';

class TransactionStreamBuilder extends StatelessWidget {
  final Database db;

  const TransactionStreamBuilder({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
      stream: watchTransactions(db), // List<TransactionModel> を返す
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final transactionModelList = snapshot.data!;

        return MyHomePage(
          db: db,
          transactionModelList: transactionModelList,
        );
      },
    );
  }
}
