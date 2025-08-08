import 'package:intl/intl.dart';

String getAmountFormat(int value, int categoryType) {
  final numberFormatter = NumberFormat("#,###");
  var result = numberFormatter.format(value);
  return (categoryType == 1) ? "-¥ $result" : "¥ $result";
}
