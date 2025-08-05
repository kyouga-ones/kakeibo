import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/views/history_screen.dart';

class HistoryViewmodel extends StatefulWidget {
  const HistoryViewmodel({super.key});

  @override
  State<HistoryViewmodel> createState() => _HistoryViewmodelState();
}

class _HistoryViewmodelState extends State<HistoryViewmodel> {
  @override
  Widget build(BuildContext context) {
    return const HistoryScreen();
  }
}
