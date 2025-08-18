import 'package:flutter/material.dart';
import 'package:kakeibo/features/graph/widget/chart_card.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChartCard());
  }
}
