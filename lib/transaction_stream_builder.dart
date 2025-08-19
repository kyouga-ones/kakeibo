import 'package:flutter/material.dart';
import 'package:kakeibo/core/database/select.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/core/stream/watch_transaction.dart';
import 'package:kakeibo/my_home_page.dart';
import 'package:sqflite/sqflite.dart';

class TransactionStreamBuilder extends StatefulWidget {
  final Database db;

  const TransactionStreamBuilder({super.key, required this.db});

  @override
  State<TransactionStreamBuilder> createState() =>
      _TransactionStreamBuilderState();
}

class _TransactionStreamBuilderState extends State<TransactionStreamBuilder> {
  var transactionModelMap = <int, TransactionModel>{};
  var transactionModelList = <TransactionModel>[];

  @override
  initState() {
    super.initState();
    () async {
      transactionModelMap = await select(widget.db);
      transactionModelList = transactionModelMap.values.toList();
    }();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: watchTransactions(widget.db),
      builder: (context, snapshot) {
        return MyHomePage(
          db: widget.db,
          transactionModelMap: transactionModelMap,
          transactionModelList: transactionModelList,
        );
      },
    );
  }
}
