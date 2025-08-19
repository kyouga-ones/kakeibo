import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionNameCard extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const TransactionNameCard({
    super.key,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '取引名',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                labelText: '取引名を入力',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
