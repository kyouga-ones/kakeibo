import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AmountCard extends StatelessWidget {
  final String? initialValue;
  final void Function(String) onChanged;

  const AmountCard({
    super.key,
    this.initialValue,
    required this.onChanged,
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
                '金額',
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
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '金額を入力',
              ),
              initialValue: initialValue,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '金額を入力してください';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          Gap(8),
        ],
      ),
    );
  }
}
