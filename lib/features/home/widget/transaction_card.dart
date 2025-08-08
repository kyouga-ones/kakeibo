import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/format.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/core/utils/get_amount_color.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';
import 'package:kakeibo/core/utils/get_category.dart';
import 'package:kakeibo/core/utils/get_payment_category.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    var strDate = dateFormat.format(transaction.date!);

    var amount = getAmountFormat(transaction.value, transaction.categoryType);
    var amountColor = getAmountColor(transaction.categoryType);

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
                      label: Text(
                        getCategory(
                          transaction.categoryType,
                          transaction.category,
                        ),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      labelPadding: EdgeInsets.symmetric(horizontal: 1),
                      visualDensity: VisualDensity(
                        horizontal: 0.0,
                        vertical: -4,
                      ),
                    ),
                    Text(
                      '$strDate・${getPaymentCategory(transaction.paymentCategory)}',
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: amountColor,
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
