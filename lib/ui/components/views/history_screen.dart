import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/cards/history_card.dart';
import 'package:kakeibo/ui/components/cards/search_card.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          HistoryCard(),
        ],
      ),
    );
  }
}
