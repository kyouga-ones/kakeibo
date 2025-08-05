import 'package:flutter/material.dart';
import 'package:kakeibo/ui/components/views/homeScreen.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
