import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/home/widget/balance_card.dart';
import 'package:kakeibo/features/home/widget/home_card.dart';
import 'package:kakeibo/features/home/widget/recent_transaction_card.dart';

class HomeScreen extends StatelessWidget {
  final int income;
  final int expenditure;
  final int balance;
  final int totalAsets;
  final List<int> balanceList;
  final List<TransactionModel> recentTransactionList;

  const HomeScreen({
    super.key,
    required this.income,
    required this.expenditure,
    required this.balance,
    required this.totalAsets,
    required this.balanceList,
    required this.recentTransactionList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: 500,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2 / 1.5,
                children: [
                  HomeCard(
                    title: '今月の収入',
                    value: income,
                    icon: Icons.trending_up,
                    color: Colors.green,
                  ),
                  HomeCard(
                    title: '今月の支出',
                    value: expenditure,
                    icon: Icons.trending_down,
                    color: Colors.red,
                  ),
                  HomeCard(
                    title: '今月の収支',
                    value: balance,
                    icon: Icons.bubble_chart,
                    color: Colors.blue,
                  ),
                  HomeCard(
                    title: '総資産',
                    value: totalAsets,
                    icon: Icons.account_balance_wallet,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            Gap(8),
            BalanceCard(balanceList: balanceList),
            Gap(8),
            RecentTransactionCard(
              recentTransactionList: recentTransactionList,
            ),
          ],
        ),
      ),
    );
  }
}
