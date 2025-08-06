import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/features/home/widget/balance_card.dart';
import 'package:kakeibo/features/home/widget/home_card.dart';
import 'package:kakeibo/features/home/widget/recent_transaction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    value: 200000,
                    icon: Icons.trending_up,
                    color: Colors.green,
                  ),
                  HomeCard(
                    title: '今月の支出',
                    value: 54100,
                    icon: Icons.trending_down,
                    color: Colors.red,
                  ),
                  HomeCard(
                    title: '今月の収支',
                    value: 145900,
                    icon: Icons.bubble_chart,
                    color: Colors.blue,
                  ),
                  HomeCard(
                    title: '総資産',
                    value: 145900,
                    icon: Icons.account_balance_wallet,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            Gap(8),
            BalanceCard(),
            Gap(8),
            RecentTransactionCard(),
          ],
        ),
      ),
    );
  }
}
