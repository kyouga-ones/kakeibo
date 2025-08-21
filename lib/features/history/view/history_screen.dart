import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/history/widget/history_list_view.dart';
import 'package:kakeibo/features/history/widget/search_card.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> mainCategoryList;
  final String? selectedMainCategory;
  final void Function(String?) onMainCategoryChanged;
  final Map<String, List<String>> subCategoryMap;
  final String? selectedSubCategory;
  final void Function(String?) onSubCategoryChanged;
  final List<String> sortList;
  final String? selectedSort;
  final void Function(String?) onSortChanged;
  final List<TransactionModel> transactionModelList;
  final void Function(TransactionModel) onEditPressed;
  final void Function(int) onYesPressed;

  const HistoryScreen({
    super.key,
    required this.mainCategoryList,
    this.selectedMainCategory,
    required this.onMainCategoryChanged,
    required this.subCategoryMap,
    this.selectedSubCategory,
    required this.onSubCategoryChanged,
    required this.sortList,
    this.selectedSort,
    required this.onSortChanged,
    required this.transactionModelList,
    required this.onEditPressed,
    required this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchCard(
              mainCategoryList: mainCategoryList,
              selectedMainCategory: selectedMainCategory,
              onMainCategoryChanged: onMainCategoryChanged,
              subCategoryMap: subCategoryMap,
              selectedSubCategory: selectedSubCategory,
              onSubCategoryChanged: onSubCategoryChanged,
              sortList: sortList,
              selectedSort: selectedSort,
              onSortChanged: onSortChanged,
            ),
            HistoryListview(
              transactionModelList: transactionModelList,
              onEditPressed: onEditPressed,
              onYesPressed: onYesPressed,
            ),
          ],
        ),
      ),
    );
  }
}
