import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/home/widget/transaction_card.dart';

class RecentTransactionCard extends StatelessWidget {
  final List<TransactionModel> recentTransactionList;

  const RecentTransactionCard({
    super.key,
    required this.recentTransactionList,
  });

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
            Wrap(
              spacing: 2.0,
              children: recentTransactionList.map((transaction) {
                return TransactionCard(
                  transaction: transaction,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
