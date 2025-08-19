import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;

  const DateCard({
    super.key,
    required this.controller,
    required this.onPressed,
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
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'yyyy/mm/dd',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: onPressed,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),
    );
  }
}
