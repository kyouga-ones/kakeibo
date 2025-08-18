import 'package:kakeibo/core/models/transaction_model.dart';

List<int> sumBalanceList(
  List<TransactionModel> transactionList,
) {
  final totals = List.filled(4, 0);

  for (final item in transactionList) {
    final type = item.categoryType;
    final category = item.paymentCategory;
    final amount = item.value;

    if (type == 1) {
      totals[category - 1] += amount;
    } else if (type == 2) {
      totals[category - 1] -= amount;
    }
  }

  return totals;
}
