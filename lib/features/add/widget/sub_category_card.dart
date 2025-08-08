import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubCategoryCard extends StatelessWidget {
  final int selectedMainCategoryIndex;
  final List<String> subCategoryList;
  final int selectedIndex;
  final void Function(bool, int) onSelected;

  const SubCategoryCard({
    super.key,
    required this.selectedMainCategoryIndex,
    required this.subCategoryList,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'カテゴリー',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Gap(8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 4.5 / 1,
              children: subCategoryList.asMap().entries.map((category) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    label: Center(
                      child: Text(category.value),
                    ),
                    labelPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(
                      horizontal: 0,
                      vertical: -2,
                    ),
                    selected: selectedIndex == category.key,
                    onSelected: (bool selected) {
                      onSelected(selected, category.key);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Gap(8),
        ],
      ),
    );
  }
}
