import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/graph/utils/get_pie_chart_color.dart';
import 'package:kakeibo/features/graph/view/graph_screen.dart';
import 'package:sqflite/sqflite.dart';

class GraphViewmodel extends StatefulWidget {
  final Database db;
  final List<TransactionModel> transactionModelList;

  const GraphViewmodel({
    super.key,
    required this.db,
    required this.transactionModelList,
  });

  @override
  State<GraphViewmodel> createState() => _GraphViewmodelState();
}

class _GraphViewmodelState extends State<GraphViewmodel> {
  @override
  Widget build(BuildContext context) {
    final list = widget.transactionModelList
        .where((item) => item.categoryType == 2)
        .toList();

    final result = list.fold<Map<int, double>>({}, (map, tx) {
      map[tx.category] = (map[tx.category] ?? 0) + tx.value;
      return map;
    });

    final sectors = result.entries
        .map((e) => SectorModel(color: getPieChartColor(e.key), value: e.value))
        .toList();

    final total = result.values.fold(
      0,
      (sum, value) => sum + value.round(),
    );

    return GraphScreen(
      categoryDetailsLMap: result,
      sectors: sectors,
      total: total,
    );
  }
}
