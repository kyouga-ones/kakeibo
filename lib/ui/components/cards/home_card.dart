import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final Color? color;

  const HomeCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");
    var result = formatter.format(value);
    var amount = "¥ $result";

    return Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              Icon(icon, color: Colors.white),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                amount,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
