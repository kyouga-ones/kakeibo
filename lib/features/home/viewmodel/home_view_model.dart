import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/list.dart';
import 'package:kakeibo/core/utils/sum_amount.dart';
import 'package:kakeibo/core/utils/sum_balance_list.dart';
import 'package:kakeibo/features/home/view/home_screen.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  var incomeList = transactionModelList
      .where((i) => i.categoryType == 1)
      .toList();
  int income = 0;

  var expenditureList = transactionModelList
      .where((i) => i.categoryType == 2)
      .toList();
  int expenditure = 0;

  int balance = 0;

  int totalAsets = 0;

  var balanceList = sumBalanceList(transactionModelList);

  @override
  void initState() {
    super.initState();
    income = sumAmount(incomeList);
    expenditure = sumAmount(expenditureList);
    balance = income - expenditure;
    totalAsets = income - expenditure;
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      income: income,
      expenditure: expenditure,
      balance: balance,
      totalAsets: totalAsets,
      transactionModelList: transactionModelList,
      balanceList: balanceList,
    );
  }
}
