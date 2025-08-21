class TransactionFormModel {
  int? id;
  int categoryType;
  int category;
  DateTime? date;
  int paymentCategory;
  int? value;

  TransactionFormModel({
    this.id,
    required this.categoryType,
    required this.category,
    this.date,
    required this.paymentCategory,
    this.value,
  });
}
