import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/ui/components/cards/transaction_card.dart';

class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "最近の取引",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Gap(20),
            TransactionCard(
              category: "光熱費",
              date: DateTime.now(),
              paymentCategory: "クレジットカード",
              value: -4000,
            ),
            TransactionCard(
              category: "住居費",
              date: DateTime.now(),
              paymentCategory: "クレジットカード",
              value: -50000,
            ),
            TransactionCard(
              category: "食費",
              date: DateTime.now(),
              paymentCategory: "クレジットカード",
              value: -100,
            ),
            TransactionCard(
              category: "給与",
              date: DateTime.now(),
              paymentCategory: "メインバンク",
              value: 200000,
            ),
          ],
        ),
      ),
    );
  }
}
