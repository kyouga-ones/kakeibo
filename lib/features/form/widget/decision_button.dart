import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_form_morel.dart';
import 'package:kakeibo/core/models/transaction_model.dart';

class DecisionPressedButton extends StatelessWidget {
  final TransactionModel? transaction;
  final TransactionFormModel postData;
  final void Function()? onAddPressed;
  final void Function()? onUpdatePressed;

  const DecisionPressedButton({
    super.key,
    this.transaction,
    required this.postData,
    required this.onAddPressed,
    required this.onUpdatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: transaction == null ? onAddPressed : onUpdatePressed,
          child: Text(transaction == null ? '追加' : '更新'),
        ),
      ),
    );
  }
}
