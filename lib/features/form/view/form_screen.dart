import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/transaction_form_morel.dart';
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
  final TransactionFormModel postData;
  final int selectedMainCategoryIndex;
  final void Function(bool) onIncomeSelected;
  final void Function(bool) onExpenditureSelected;
  final String? initialValue;
  final void Function(String) onAmountChanged;
  final List<String> subCategoryList;
  final int selectedSubCategoryIndex;
  final void Function(bool, int) onSubCategorySelected;
  final int selectedAccount;
  final Map<int, String> accountMap;
  final void Function(int?) onAccountChanged;
  final TextEditingController dateTextEditingController;
  final void Function() onSelectDatePressed;
  final void Function(String) onDateChanged;
  final TextEditingController transactionTextEditingController;
  final String? Function(String?) transactionValidator;
  final void Function()? onAddPressed;
  final void Function()? onUpdatePressed;

  const FormScreen({
    super.key,
    this.transaction,
    required this.formKey,
    required this.postData,
    required this.selectedMainCategoryIndex,
    required this.onIncomeSelected,
    required this.onExpenditureSelected,
    this.initialValue,
    required this.onAmountChanged,
    required this.subCategoryList,
    required this.selectedSubCategoryIndex,
    required this.onSubCategorySelected,
    required this.selectedAccount,
    required this.accountMap,
    required this.onAccountChanged,
    required this.dateTextEditingController,
    required this.onSelectDatePressed,
    required this.onDateChanged,
    required this.transactionTextEditingController,
    required this.transactionValidator,
    required this.onAddPressed,
    required this.onUpdatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(transaction == null ? '新規追加' : '編集')),
      body: SafeArea(
        child: Form(
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
                        accountMap: accountMap,
                        onChanged: onAccountChanged,
                      ),
                    ),
                    Expanded(
                      child: DateCard(
                        controller: dateTextEditingController,
                        onPressed: onSelectDatePressed,
                        onDateChanged: onDateChanged,
                      ),
                    ),
                  ],
                ),
                DecisionPressedButton(
                  transaction: transaction,
                  postData: postData,
                  onAddPressed:
                      (postData.date != null && postData.value != null)
                      ? onAddPressed
                      : null,
                  onUpdatePressed:
                      (postData.date != null &&
                          dateTextEditingController.text != "" &&
                          postData.value != null)
                      ? onUpdatePressed
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
