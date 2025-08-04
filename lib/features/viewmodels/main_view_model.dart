import 'package:flutter/material.dart';
import 'package:kakeibo/features/viewmodels/home_page_view_model.dart';
import 'package:kakeibo/features/views/main_model.dart';

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePageView(
      title: widget.title,
      counter: _counter,
      incrementCounter: _incrementCounter,
    );
  }
}
