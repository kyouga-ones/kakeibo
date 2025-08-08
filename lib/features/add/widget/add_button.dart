import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final void Function() onPressed;

  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text('追加'),
        ),
      ),
    );
  }
}
