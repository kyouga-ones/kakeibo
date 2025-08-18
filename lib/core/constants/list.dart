import 'package:kakeibo/core/models/transaction_model.dart';

const List<String> incomeCategoryList = ['給与', 'ボーナス', '副業', '証券', 'その他収入'];

const List<String> expenditureCategoryList = [
  '食費',
  '住居費',
  '交通費',
  '光熱費',
  '通信費',
  '医療費',
  '教育費',
  '娯楽費',
  '衣類費',
  'その他支出',
];

const List<String> accountList = ['現金', 'メイン口座', 'クレジットカード', '証券口座'];

final List<TransactionModel> transactionModelList = [
  TransactionModel(
    categoryType: 1,
    category: 1,
    date: DateTime.now(),
    paymentCategory: 1,
    value: 4000,
  ),
  TransactionModel(
    categoryType: 2,
    category: 1,
    date: DateTime.now(),
    paymentCategory: 2,
    value: 1000,
  ),
  TransactionModel(
    categoryType: 1,
    category: 3,
    date: DateTime.now(),
    paymentCategory: 3,
    value: 100000,
  ),
  TransactionModel(
    categoryType: 2,
    category: 1,
    date: DateTime.now(),
    paymentCategory: 2,
    value: 500,
  ),
  TransactionModel(
    categoryType: 2,
    category: 2,
    date: DateTime.now(),
    paymentCategory: 2,
    value: 1000,
  ),
];
