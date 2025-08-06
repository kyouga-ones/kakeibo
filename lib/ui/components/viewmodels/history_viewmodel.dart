import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/views/history_screen.dart';

class HistoryViewmodel extends StatefulWidget {
  const HistoryViewmodel({super.key});

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

  final List<String> incomeCategoryList = [
    '給与',
    'ボーナス',
    '副業',
    '証券',
    'その他収入',
  ];

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

  @override
  void initState() {
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
    );
  }
}
