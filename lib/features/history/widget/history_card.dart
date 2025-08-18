import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/constants/format.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/core/utils/get_amount_color.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';
import 'package:kakeibo/core/utils/get_category.dart';
import 'package:kakeibo/core/utils/get_payment_category.dart';

class HistoryCard extends StatelessWidget {
  final TransactionModel transaction;
  final void Function() onEditPuressed;
  final void Function() onDeletePuressed;

  const HistoryCard({
    super.key,
    required this.transaction,
    required this.onEditPuressed,
    required this.onDeletePuressed,
  });

  @override
  Widget build(BuildContext context) {
    var strDate = dateFormat.format(transaction.date!);
    var amount = getAmountFormat(transaction.value, transaction.categoryType);
    var amountColor = getAmountColor(transaction.categoryType);

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
                    Gap(8),
                    Text(strDate),
                  ],
                ),
                Gap(4),
                Text(getPaymentCategory(transaction.paymentCategory)),
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
