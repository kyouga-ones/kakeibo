import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/cards/home_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
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
                title: '今月の収入',
                value: 145900,
                icon: Icons.account_balance_wallet,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
