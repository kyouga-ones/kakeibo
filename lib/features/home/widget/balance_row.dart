import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';

class BalanceRow extends StatelessWidget {
  final Color color;
  final String title;
  final int value;
  final String tag;

  const BalanceRow({
    super.key,
    required this.color,
    required this.title,
    required this.value,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    var amount = (value >= 0)
        ? getAmountFormat(value, 1)
        : getAmountFormat(-value, 0);

    return Row(
      children: [
        Icon(Icons.circle, color: color),
        Gap(8),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Gap(8),
        Chip(
          label: Text(tag),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          labelPadding: EdgeInsets.symmetric(horizontal: 1),
          visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
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
    );
  }
}
