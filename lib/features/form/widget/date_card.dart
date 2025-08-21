import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;
  final void Function(String) onDateChanged;

  const DateCard({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '日付設定',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'yyyy/mm/dd',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: onPressed,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '日付を入力してください';
                }
                return null;
              },
              onChanged: onDateChanged,
              keyboardType: TextInputType.datetime,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }
}
