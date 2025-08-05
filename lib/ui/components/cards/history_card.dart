import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final String category;
  final DateTime date;
  final String paymentCategory;
  final int value;

  const HistoryCard({
    super.key,
    required this.category,
    required this.date,
    required this.paymentCategory,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yy-MM-dd');

    var dateOnly = DateTime(date.year, date.month, date.day);
    var strDate = formatter.format(dateOnly);

    final numberFormatter = NumberFormat("#,###");
    var result = numberFormatter.format(value);
    var amount = "¥ $result";

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(category),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      labelPadding: EdgeInsets.symmetric(horizontal: 1),
                      visualDensity: VisualDensity(
                        horizontal: 0.0,
                        vertical: -4,
                      ),
                    ),
                    Text('$strDate・$paymentCategory'),
                  ],
                ),
                Spacer(),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: (value >= 0) ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
