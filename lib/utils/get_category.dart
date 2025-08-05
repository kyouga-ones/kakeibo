import 'package:kakeibo/utils/get_expenditure_category.dart';
import 'package:kakeibo/utils/get_income_category.dart';

String getCategory(int categoryType, int category) {
  switch (categoryType) {
    case 1:
      return getIncomeCategory(category);
    case 2:
      return getExpenditureCategory(category);
    default:
      return "";
  }
}
