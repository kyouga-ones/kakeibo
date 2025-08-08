import 'package:flutter/material.dart';
import 'package:kakeibo/features/add/view/add_screen.dart';

class AddViewModel extends StatefulWidget {
  const AddViewModel({super.key});

  @override
  State<AddViewModel> createState() => _AddViewModelState();
}

class _AddViewModelState extends State<AddViewModel> {
  final formKey = GlobalKey<FormState>();

  var selectedMainCategoryIndex = 1;
  void onIncomeSelected(bool isSelected) {
    setState(() {
      selectedMainCategoryIndex = 1;
      selectedSubCategoryIndex = 0;
    });
  }

  void onExpenditureSelected(bool isSelected) {
    setState(() {
      selectedMainCategoryIndex = 2;
      selectedSubCategoryIndex = 0;
    });
  }

  String? amountValue;
  void onAmountChanged(String value) {
    amountValue = value;
  }

  final List<String> incomeCategoryList = ['給与', 'ボーナス', '副業', '証券', 'その他収入'];

  final List<String> expenditureCategoryList = [
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

  var selectedSubCategoryIndex = 0;
  void onSubCategorySelected(bool isSelected, int index) {
    setState(() {
      selectedSubCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddScreen(
      formKey: formKey,
      selectedMainCategoryIndex: selectedMainCategoryIndex,
      onIncomeSelected: onIncomeSelected,
      onExpenditureSelected: onExpenditureSelected,
      onAmountChanged: onAmountChanged,
      subCategoryList: selectedMainCategoryIndex == 1
          ? incomeCategoryList
          : expenditureCategoryList,
      selectedSubCategoryIndex: selectedSubCategoryIndex,
      onSubCategorySelected: onSubCategorySelected,
    );
  }
}
