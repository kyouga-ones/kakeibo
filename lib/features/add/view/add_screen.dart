import 'package:flutter/material.dart';
import 'package:kakeibo/features/add/widget/account_card.dart';
import 'package:kakeibo/features/add/widget/amount_card.dart';
import 'package:kakeibo/features/add/widget/date_card.dart';
import 'package:kakeibo/features/add/widget/main_category_card.dart';
import 'package:kakeibo/features/add/widget/sub_category_card.dart';
import 'package:kakeibo/features/add/widget/transaction_name_card.dart';

class AddScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final int selectedMainCategoryIndex;
  final void Function(bool) onIncomeSelected;
  final void Function(bool) onExpenditureSelected;
  final void Function(String) onAmountChanged;
  final List<String> subCategoryList;
  final int selectedSubCategoryIndex;
  final void Function(bool, int) onSubCategorySelected;
  final String selectedAccount;
  final List<String> accountList;
  final void Function(String?) onAccountChanged;
  final TextEditingController dateTextEditingController;
  final void Function() onSelectDatePressed;
  final TextEditingController transactionTextEditingController;
  final String? Function(String?) transactionValidator;

  const AddScreen({
    super.key,
    required this.formKey,
    required this.selectedMainCategoryIndex,
    required this.onIncomeSelected,
    required this.onExpenditureSelected,
    required this.onAmountChanged,
    required this.subCategoryList,
    required this.selectedSubCategoryIndex,
    required this.onSubCategorySelected,
    required this.selectedAccount,
    required this.accountList,
    required this.onAccountChanged,
    required this.dateTextEditingController,
    required this.onSelectDatePressed,
    required this.transactionTextEditingController,
    required this.transactionValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新しい取引を追加')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TransactionNameCard(
                controller: transactionTextEditingController,
                validator: transactionValidator,
              ),
              MainCategoryCard(
                selectedIndex: selectedMainCategoryIndex,
                onIncomeSelected: onIncomeSelected,
                onExpenditureSelected: onExpenditureSelected,
              ),
              AmountCard(
                onChanged: onAmountChanged,
              ),
              SubCategoryCard(
                selectedMainCategoryIndex: selectedMainCategoryIndex,
                subCategoryList: subCategoryList,
                selectedIndex: selectedSubCategoryIndex,
                onSelected: onSubCategorySelected,
              ),
              Row(
                children: [
                  Expanded(
                    child: AccountCard(
                      selectedAccount: selectedAccount,
                      accountList: accountList,
                      onChanged: onAccountChanged,
                    ),
                  ),
                  Expanded(
                    child: DateCard(
                      controller: dateTextEditingController,
                      onPressed: onSelectDatePressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
