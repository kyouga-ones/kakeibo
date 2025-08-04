import 'package:flutter/material.dart';

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
    return Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                Text(title, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Text(value.toString(), style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
