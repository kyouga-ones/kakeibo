import 'package:flutter/material.dart';
import 'package:kakeibo/transaction_stream_builder.dart';
import 'package:sqflite/sqflite.dart';

class MyApp extends StatelessWidget {
  final Database db;

  const MyApp({
    super.key,
    required this.db,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TransactionStreamBuilder(db: db),
    );
  }
}
