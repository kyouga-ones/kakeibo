import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/form/widget/account_card.dart';
import 'package:kakeibo/features/form/widget/amount_card.dart';
import 'package:kakeibo/features/form/widget/date_card.dart';
import 'package:kakeibo/features/form/widget/decision_button.dart';
import 'package:kakeibo/features/form/widget/main_category_card.dart';
import 'package:kakeibo/features/form/widget/sub_category_card.dart';
import 'package:kakeibo/features/form/widget/transaction_name_card.dart';

class FormScreen extends StatelessWidget {
  final TransactionModel? transaction;
  final GlobalKey<FormState> formKey;
  final int selectedMainCategoryIndex;
  final void Function(bool) onIncomeSelected;
  final void Function(bool) onExpenditureSelected;
  final String? initialValue;
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
  final void Function() onDecisionPressed;

  const FormScreen({
    super.key,
    this.transaction,
    required this.formKey,
    required this.selectedMainCategoryIndex,
    required this.onIncomeSelected,
    required this.onExpenditureSelected,
    this.initialValue,
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
    required this.onDecisionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(transaction == null ? '新規追加' : '編集')),
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
                initialValue: initialValue,
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
              DecisionPressedButton(
                transaction: transaction,
                onPressed: onDecisionPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
