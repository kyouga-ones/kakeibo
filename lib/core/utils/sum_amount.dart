import 'package:kakeibo/core/models/transaction_model.dart';

int sumAmount(List<TransactionModel> transactionModelList) {
  int total = 0;

  for (final item in transactionModelList) {
    final amount = item.value;

    total += amount;
  }

  return total;
}
