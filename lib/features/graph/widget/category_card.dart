import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';

class CategoryCard extends StatelessWidget {
  final int value;
  final String title;
  final Color color;
  final double proportion;

  const CategoryCard({
    super.key,
    required this.value,
    required this.title,
    required this.color,
    required this.proportion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.circle, color: color),
            Gap(8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  getAmountFormat(value, 1),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${(proportion).toStringAsFixed(1)}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
