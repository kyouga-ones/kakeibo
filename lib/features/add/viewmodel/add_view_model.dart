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

  final TextEditingController dateTextEditingController =
      TextEditingController();

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
        dateTextEditingController.text = dateFormat.format(picked);
      });
    }
  }

  final TextEditingController transactionTextEditingController =
      TextEditingController();
  String? transactionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '取引名を入力してください';
    }
    return null;
  }

  @override
  void dispose() {
    dateTextEditingController.dispose();
    transactionTextEditingController.dispose();
    super.dispose();
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
      dateTextEditingController: dateTextEditingController,
      onSelectDatePressed: onSelectDatePressed,
      transactionTextEditingController: transactionTextEditingController,
      transactionValidator: transactionValidator,
    );
  }
}
