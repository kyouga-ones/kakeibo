import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/format.dart';
import 'package:kakeibo/core/constants/list.dart';
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

  var selectedSubCategoryIndex = 0;

  void onSubCategorySelected(bool isSelected, int index) {
    setState(() {
      selectedSubCategoryIndex = index;
    });
  }

  var selectedAccount = '現金';

  void onAccountChanged(String? value) {
    setState(() {
      selectedAccount = value!;
    });
  }

  final TextEditingController controller = TextEditingController();

  Future<void> onSelectDatePressed() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        controller.text = dateFormat.format(picked);
      });
    }
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
      selectedAccount: selectedAccount,
      accountList: accountList,
      onAccountChanged: onAccountChanged,
      textEditingController: controller,
      onSelectDatePressed: onSelectDatePressed,
    );
  }
}
