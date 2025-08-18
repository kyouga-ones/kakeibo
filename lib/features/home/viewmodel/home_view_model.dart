import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/list.dart';
import 'package:kakeibo/core/utils/sum_balance_list.dart';
import 'package:kakeibo/features/home/view/home_screen.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  var balanceList = sumBalanceList(transactionModelList);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      transactionModelList: transactionModelList,
      balanceList: balanceList,
    );
  }
}
