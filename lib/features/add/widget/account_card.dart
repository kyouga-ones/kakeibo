import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String selectedAccount;
  final List<String> accountList;
  final void Function(String?) onChanged;

  const AccountCard({
    super.key,
    required this.selectedAccount,
    required this.accountList,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '口座',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedAccount,
              hint: Text('選択してください'),
              items: accountList.map((account) {
                return DropdownMenuItem(
                  value: account,
                  child: Text(account),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
