import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final int selectedAccount;
  final Map<int, String> accountMap;
  final void Function(int?) onChanged;

  const AccountCard({
    super.key,
    required this.selectedAccount,
    required this.accountMap,
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
            DropdownButton<int>(
              isExpanded: true,
              value: selectedAccount,
              hint: Text('選択してください'),
              items: accountMap.entries.map((entry) {
                return DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(entry.value),
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
