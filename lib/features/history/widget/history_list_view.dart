import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/history/widget/delete_dialog.dart';
import 'package:kakeibo/features/history/widget/history_card.dart';

class HistoryListview extends StatelessWidget {
  final List<TransactionModel> transactionModelList;
  final void Function(TransactionModel) onEditPressed;
  final void Function(int) onYesPressed;

  const HistoryListview({
    super.key,
    required this.transactionModelList,
    required this.onEditPressed,
    required this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: transactionModelList.asMap().entries.map((entry) {
          final transactionData = entry.value;
          final index = entry.key;

          return HistoryCard(
            transaction: transactionData,
            onEditPressed: onEditPressed,
            onDeletePressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteDialog(
                    index: index,
                    onYesPressed: onYesPressed,
                  );
                },
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
