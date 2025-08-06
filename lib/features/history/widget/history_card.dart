import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final int categoryType;
  final String category;
  final DateTime date;
  final String paymentCategory;
  final int value;
  final void Function() onEditPuressed;
  final void Function() onDeletePuressed;

  const HistoryCard({
    super.key,
    required this.categoryType,
    required this.category,
    required this.date,
    required this.paymentCategory,
    required this.value,
    required this.onEditPuressed,
    required this.onDeletePuressed,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yy-MM-dd');

    var dateOnly = DateTime(date.year, date.month, date.day);
    var strDate = formatter.format(dateOnly);

    final numberFormatter = NumberFormat("#,###");
    var result = numberFormatter.format(value);
    var amount = (categoryType == 1) ? "-¥ $result" : "¥ $result";

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                    Gap(8),
                    Text(strDate),
                  ],
                ),
                Gap(4),
                Text(paymentCategory),
              ],
            ),
            Spacer(),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: (categoryType == 1) ? Colors.red : Colors.green,
              ),
            ),
            Gap(8),
            Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onEditPuressed,
                    icon: Icon(Icons.edit),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onDeletePuressed,
                    icon: Icon(Icons.delete),
                    color: Colors.red,
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
