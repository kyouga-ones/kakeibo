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

  // List<SectorModel> sectors = [
  //   SectorModel(color: Color(0xFFE41A1C), value: 50),
  //   SectorModel(color: Color(0xFF377EB8), value: 30),
  //   SectorModel(color: Color(0xFF4DAF4A), value: 10),
  //   SectorModel(color: Color(0xFFFF7F00), value: 5),
  //   SectorModel(color: Color(0xFF984EA3), value: 3),
  //   SectorModel(color: Color(0xFFFFE119), value: 2),
  //   SectorModel(color: Color(0xFFA65628), value: 2),
  //   SectorModel(color: Color(0xFFF781BF), value: 2),
  //   SectorModel(color: Color(0xFF66C2A5), value: 2),
  //   SectorModel(color: Color(0xFF999999), value: 2),
  // ];

  late final sectors = result.entries
      .map((e) => SectorModel(color: getPieChartColor(e.key), value: e.value))
      .toList();

  // @override
  // void initState() {
  //   super.initState();
  //   list = <TransactionModel>[];
  // }

  @override
  Widget build(BuildContext context) {
    return GraphScreen(
      categoryDetailsLMap: result,
      sectors: sectors,
    );
  }
}
