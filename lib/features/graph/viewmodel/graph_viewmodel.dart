import 'package:flutter/material.dart';
import 'package:kakeibo/core/constants/list.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/features/graph/utils/get_pie_chart_color.dart';
import 'package:kakeibo/features/graph/view/graph_screen.dart';

class GraphViewmodel extends StatefulWidget {
  const GraphViewmodel({super.key});

  @override
  State<GraphViewmodel> createState() => _GraphViewmodelState();
}

class _GraphViewmodelState extends State<GraphViewmodel> {
  var list = transactionModelList
      .where((item) => item.categoryType == 2)
      .toList();

  late final result = list.fold<Map<int, double>>({}, (map, tx) {
    map[tx.category] = (map[tx.category] ?? 0) + tx.value;
    return map;
  });

  late final sectors = result.entries
      .map((e) => SectorModel(color: getPieChartColor(e.key), value: e.value))
      .toList();

  late final total = result.values.fold(0, (sum, value) => sum + value.round());

  @override
  Widget build(BuildContext context) {
    return GraphScreen(
      categoryDetailsLMap: result,
      sectors: sectors,
      total: total,
    );
  }
}
