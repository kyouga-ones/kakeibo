import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final List<String> mainCategoryList;
  final String? selectedMainCategory;
  final void Function(String?) onMainCategoryChanged;
  final Map<String, List<String>> subCategoryMap;
  final String? selectedSubCategory;
  final void Function(String?) onSubCategoryChanged;
  final List<String> sortList;
  final String? selectedSort;
  final void Function(String?) onSortChanged;

  const SearchCard({
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
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'テキストフィールド',
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                DropdownButton(
                  items: mainCategoryList.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: onMainCategoryChanged,
                  value: selectedMainCategory,
                ),
                DropdownButton(
                  items: subCategoryMap[selectedMainCategory]!.map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onSubCategoryChanged,
                  value: selectedSubCategory,
                ),
                DropdownButton(
                  items: sortList.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: onSortChanged,
                  value: selectedSort,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
