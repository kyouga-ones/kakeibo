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
            child: Wrap(
              spacing: 8.0,
              children: subCategoryList.asMap().entries.map((entry) {
                final index = entry.key;
                final label = entry.value;

                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  child: ChoiceChip(
                    label: Center(child: Text(label)),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      onSelected(selected, index);
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
