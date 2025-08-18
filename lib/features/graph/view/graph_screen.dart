import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/features/graph/widget/chart_card.dart';

class GraphScreen extends StatelessWidget {
  final Map<int, double> categoryDetailsLMap;
  final List<SectorModel> sectors;

  const GraphScreen({
    super.key,
    required this.categoryDetailsLMap,
    required this.sectors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChartCard(
        categoryDetailsLMap: categoryDetailsLMap,
        sectors: sectors,
      ),
    );
  }
}
