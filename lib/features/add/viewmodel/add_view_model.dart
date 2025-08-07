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
    });
  }

  void onExpenditureSelected(bool isSelected) {
    setState(() {
      selectedMainCategoryIndex = 2;
    });
  }

  String? amountValue;
  void onAmountChanged(String value) {
    amountValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return AddScreen(
      formKey: formKey,
      selectedMainCategoryIndex: selectedMainCategoryIndex,
      onIncomeSelected: onIncomeSelected,
      onExpenditureSelected: onExpenditureSelected,
      onAmountChanged: onAmountChanged,
    );
  }
}
