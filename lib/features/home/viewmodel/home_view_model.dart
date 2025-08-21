import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/core/utils/sum_amount.dart';
import 'package:kakeibo/core/utils/sum_balance_list.dart';
import 'package:kakeibo/features/home/view/home_screen.dart';
import 'package:sqflite/sqflite.dart';

class HomeViewModel extends StatefulWidget {
  final Database db;
  final List<TransactionModel> transactionModelList;

  const HomeViewModel({
    super.key,
    required this.db,
    required this.transactionModelList,
  });

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  late List<TransactionModel> incomeList;
  late List<TransactionModel> expenditureList;
  late List<int> balanceList;
  int income = 0;
  int expenditure = 0;

  int balance = 0;

  int totalAsets = 0;

  List<TransactionModel> recentTransactionList = [];

  @override
  initState() {
    super.initState();

    incomeList = widget.transactionModelList
        .where((i) => i.categoryType == 1)
        .toList();

    expenditureList = widget.transactionModelList
        .where((i) => i.categoryType == 2)
        .toList();

    balanceList = sumBalanceList(widget.transactionModelList);

    income = sumAmount(incomeList);
    expenditure = sumAmount(expenditureList);
    balance = income - expenditure;
    totalAsets = income - expenditure;

    recentTransactionList = widget.transactionModelList.reversed
        .toList()
        .take(5)
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      income: income,
      expenditure: expenditure,
      balance: balance,
      totalAsets: totalAsets,
      balanceList: balanceList,
      recentTransactionList: recentTransactionList,
    );
  }
}
