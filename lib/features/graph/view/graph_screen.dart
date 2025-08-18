import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/features/graph/widget/chart_card.dart';

class GraphScreen extends StatelessWidget {
  final Map<int, double> categoryDetailsLMap;
  final List<SectorModel> sectors;
  final int total;

  const GraphScreen({
    super.key,
    required this.categoryDetailsLMap,
    required this.sectors,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChartCard(
        categoryDetailsMap: categoryDetailsLMap,
        sectors: sectors,
        total: total,
      ),
    );
  }
}
