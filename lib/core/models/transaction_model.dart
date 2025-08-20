class TransactionModel {
  int? id;
  int categoryType = 0;
  int category = 0;
  DateTime? date;
  int paymentCategory = 0;
  int value = 0;

  TransactionModel({
    this.id,
    required this.categoryType,
    required this.category,
    required this.date,
    required this.paymentCategory,
    required this.value,
  });
}
