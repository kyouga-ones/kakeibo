import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/format.dart';
import 'package:kakeibo/core/constants/list.dart';
import 'package:kakeibo/core/constants/map.dart';
import 'package:kakeibo/core/database/insert.dart';
import 'package:kakeibo/core/database/update.dart';
import 'package:kakeibo/core/models/transaction_form_morel.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/form/view/form_screen.dart';
import 'package:sqflite/sqflite.dart';

class FormViewModel extends StatefulWidget {
  final Database db;
  final int? transactionId;
  final TransactionModel? transaction;

  const FormViewModel({
    super.key,
    required this.db,
    this.transactionId,
    this.transaction,
  });

  @override
  State<FormViewModel> createState() => _FormViewModelState();
}

class _FormViewModelState extends State<FormViewModel> {
  final formKey = GlobalKey<FormState>();

  var postData = TransactionFormModel(
    categoryType: 1,
    category: 0,
    date: DateTime.now(),
    paymentCategory: 1,
  );

  var selectedMainCategoryIndex = 1;
  void onIncomeSelected(bool isSelected) {
    setState(() {
      selectedMainCategoryIndex = 1;
      selectedSubCategoryIndex = 0;
      postData.categoryType = 1;
      postData.category = 0;
    });
  }

  void onExpenditureSelected(bool isSelected) {
    setState(() {
      selectedMainCategoryIndex = 2;
      selectedSubCategoryIndex = 0;
      postData.categoryType = 2;
      postData.category = 0;
    });
  }

  String? amountValue;

  void onAmountChanged(String value) {
    setState(() {
      amountValue = value;
      postData.value = value != "" ? int.parse(value) : null;
    });
  }

  var selectedSubCategoryIndex = 0;

  void onSubCategorySelected(bool isSelected, int index) {
    setState(() {
      selectedSubCategoryIndex = index;
      postData.category = index;
    });
  }

  var selectedAccount = 1;

  void onAccountChanged(int? value) {
    setState(() {
      selectedAccount = value!;
      postData.paymentCategory = value;
    });
  }

  TextEditingController dateTextEditingController = TextEditingController(
    text: dateFormat.format(DateTime.now()),
  );

  Future<void> onSelectDatePressed() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        dateTextEditingController.text = dateFormat.format(picked);
        postData.date = picked;
      });
    }
  }

  void onDateChanged(String str) {
    setState(() {
      try {
        postData.date = dateFormat.parse(dateTextEditingController.text);
      } catch (_) {
        postData.date = null;
      }
    });
  }

  final TextEditingController transactionTextEditingController =
      TextEditingController();
  String? transactionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '取引名を入力してください';
    }
    return null;
  }

  int id = 0;

  void onAddPressed() {
    insert(
      widget.db,
      postData.categoryType,
      postData.category,
      postData.date!,
      postData.paymentCategory,
      postData.value!,
    );
    Navigator.pop(context);
  }

  void onUpdatePressed() {
    update(
      widget.db,
      id,
      postData.categoryType,
      postData.category,
      postData.date!,
      postData.paymentCategory,
      postData.value!,
    );
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.transactionId != null) {
      id = widget.transactionId!;
    }

    if (widget.transaction != null) {
      dateTextEditingController.text = dateFormat.format(
        widget.transaction!.date!,
      );
      selectedMainCategoryIndex = widget.transaction!.categoryType;
      amountValue = widget.transaction!.value.toString();
      selectedSubCategoryIndex = widget.transaction!.category;
      selectedAccount = widget.transaction!.paymentCategory;

      postData = TransactionFormModel(
        categoryType: widget.transaction!.categoryType,
        category: widget.transaction!.category,
        paymentCategory: widget.transaction!.paymentCategory,
        date: widget.transaction!.date,
        value: widget.transaction!.value,
      );
    }

    setState(() {});
  }

  @override
  void dispose() {
    dateTextEditingController.dispose();
    transactionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormScreen(
      transaction: widget.transaction,
      formKey: formKey,
      postData: postData,
      selectedMainCategoryIndex: selectedMainCategoryIndex,
      onIncomeSelected: onIncomeSelected,
      onExpenditureSelected: onExpenditureSelected,
      initialValue: amountValue,
      onAmountChanged: onAmountChanged,
      subCategoryList: selectedMainCategoryIndex == 1
          ? incomeCategoryList
          : expenditureCategoryList,
      selectedSubCategoryIndex: selectedSubCategoryIndex,
      onSubCategorySelected: onSubCategorySelected,
      selectedAccount: selectedAccount,
      accountMap: accountMap,
      onAccountChanged: onAccountChanged,
      dateTextEditingController: dateTextEditingController,
      onSelectDatePressed: onSelectDatePressed,
      onDateChanged: onDateChanged,
      transactionTextEditingController: transactionTextEditingController,
      transactionValidator: transactionValidator,
      onAddPressed: onAddPressed,
      onUpdatePressed: onUpdatePressed,
    );
  }
}
