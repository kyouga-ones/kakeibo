import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final void Function(int) onYesPressed;
  final int id;

  const DeleteDialog({
    super.key,
    required this.onYesPressed,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        '本当に削除しますか？',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).canvasColor,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('いいえ'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                onYesPressed(id);
                Navigator.pop(context);
              },
              child: const Text('はい'),
            ),
          ],
        ),
      ],
    );
  }
}
