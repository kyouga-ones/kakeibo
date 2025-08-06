import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/ui/components/rows/balance_row.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "口座残高",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Gap(20),
            BalanceRow(color: Colors.green, title: "現金", value: 0, tag: "cash"),
            Gap(4),
            BalanceRow(
              color: Colors.blue,
              title: "メイン口座",
              value: 200000,
              tag: "bank",
            ),
            Gap(4),
            BalanceRow(
              color: Colors.red,
              title: "クレジットカード",
              value: -54100,
              tag: "credit",
            ),
            Gap(4),
            BalanceRow(
              color: Colors.purple,
              title: "証券口座",
              value: 0,
              tag: "inverstment",
            ),
          ],
        ),
      ),
    );
  }
}
