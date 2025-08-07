import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainCategoryCard extends StatelessWidget {
  final int selectedIndex;
  final void Function(bool) onIncomeSelected;
  final void Function(bool) onExpenditureSelected;

  const MainCategoryCard({
    super.key,
    required this.selectedIndex,
    required this.onIncomeSelected,
    required this.onExpenditureSelected,
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
                '種類',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Gap(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: Center(
                      child: Text('収入'),
                    ),
                    selected: selectedIndex == 1,
                    onSelected: onIncomeSelected,
                  ),
                ),
                Gap(8),
                Expanded(
                  child: ChoiceChip(
                    label: Center(
                      child: Text('支出'),
                    ),
                    selected: selectedIndex == 2,
                    onSelected: onExpenditureSelected,
                  ),
                ),
              ],
            ),
          ),
          Gap(8),
        ],
      ),
    );
  }
}
