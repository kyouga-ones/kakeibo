import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';

class AddButton extends StatelessWidget {
  final TransactionModel? transaction;
  final void Function() onPressed;

  const AddButton({
    super.key,
    this.transaction,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(transaction == null ? '追加' : '更新'),
        ),
      ),
    );
  }
}
