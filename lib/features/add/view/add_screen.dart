import 'package:flutter/material.dart';
import 'package:kakeibo/features/add/widget/amount_card.dart';
import 'package:kakeibo/features/add/widget/main_category_card.dart';

class AddScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final int selectedMainCategoryIndex;
  final void Function(bool) onIncomeSelected;
  final void Function(bool) onExpenditureSelected;
  final void Function(String) onAmountChanged;

  const AddScreen({
    super.key,
    required this.formKey,
    required this.selectedMainCategoryIndex,
    required this.onIncomeSelected,
    required this.onExpenditureSelected,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新しい取引を追加'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            MainCategoryCard(
              selectedIndex: selectedMainCategoryIndex,
              onIncomeSelected: onIncomeSelected,
              onExpenditureSelected: onExpenditureSelected,
            ),
            AmountCard(
              onChanged: onAmountChanged,
            ),
          ],
        ),
      ),
    );
  }
}
