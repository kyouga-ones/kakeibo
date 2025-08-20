import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/list.dart';
import 'package:kakeibo/core/database/delete.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/form/viewmodel/form_view_model.dart';
import 'package:kakeibo/features/history/view/history_screen.dart';
import 'package:sqflite/sqflite.dart';

class HistoryViewmodel extends StatefulWidget {
  final Database db;
  final List<TransactionModel> transactionModelList;

  const HistoryViewmodel({
    super.key,
    required this.db,
    required this.transactionModelList,
  });

  @override
  State<HistoryViewmodel> createState() => _HistoryViewmodelState();
}

class _HistoryViewmodelState extends State<HistoryViewmodel> {
  final List<String> mainCategoryList = ['すべて', '収入', '支出'];
  String? selectedMainCategory = 'すべて';
  void onMainCategoryChanged(String? value) {
    selectedMainCategory = value;
    setState(() {});
  }

  String? selectedSubCategory = 'すべて';
  void onSubCategoryChanged(String? value) {
    selectedSubCategory = value;
    setState(() {});
  }

  late final Map<String, List<String>> subCategoryMap;

  List<String> sortList = ['日付順', '金額順'];
  String? selectedSort;
  void onSortChanged(String? value) {
    selectedSort = value;
    setState(() {});
  }

  void onEditPressed(TransactionModel transaction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FormViewModel(db: widget.db, transaction: transaction),
      ),
    );
  }

  void onYesPressed(int index) {
    delete(widget.db, index);
  }

  @override
  initState() {
    super.initState();
    subCategoryMap = {
      'すべて': ['すべて', ...incomeCategoryList, ...expenditureCategoryList],
      '収入': ['すべて', ...incomeCategoryList],
      '支出': ['すべて', ...expenditureCategoryList],
    };
    selectedSort = sortList[0];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> availableSubCategories =
        subCategoryMap[selectedMainCategory]!;

    if (!availableSubCategories.contains(selectedSubCategory)) {
      selectedSubCategory = availableSubCategories[0];
    }

    return HistoryScreen(
      mainCategoryList: mainCategoryList,
      selectedMainCategory: selectedMainCategory,
      onMainCategoryChanged: onMainCategoryChanged,
      subCategoryMap: subCategoryMap,
      onSubCategoryChanged: onSubCategoryChanged,
      selectedSubCategory: selectedSubCategory,
      sortList: sortList,
      selectedSort: selectedSort,
      onSortChanged: onSortChanged,
      transactionModelList: widget.transactionModelList,
      onEditPressed: onEditPressed,
      onYesPressed: onYesPressed,
    );
  }
}
