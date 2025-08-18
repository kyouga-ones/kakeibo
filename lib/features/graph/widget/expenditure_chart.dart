import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/sector_model.dart';

class ExpenditureChart extends StatelessWidget {
  const ExpenditureChart({super.key});

  @override
  Widget build(BuildContext context) {
    return pieChart();
    // final screenWidth = MediaQuery.of(context).size.width;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('カテゴリ別支出'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: SizedBox(
    //       width: screenWidth * 0.95,
    //       height: screenWidth * 0.95 * 0.65,
    //       child: pieChart(),
    //     ),
    //   ),
    // );
  }

  Widget pieChart() {
    List<SectorModel> sectors = [
      SectorModel(color: Color(0xFFE41A1C), value: 50),
      SectorModel(color: Color(0xFF377EB8), value: 30),
      SectorModel(color: Color(0xFF4DAF4A), value: 10),
      SectorModel(color: Color(0xFFFF7F00), value: 5),
      SectorModel(color: Color(0xFF984EA3), value: 3),
      SectorModel(color: Color(0xFFFFE119), value: 2),
      SectorModel(color: Color(0xFFA65628), value: 2),
      SectorModel(color: Color(0xFFF781BF), value: 2),
      SectorModel(color: Color(0xFF66C2A5), value: 2),
      SectorModel(color: Color(0xFF999999), value: 2),
    ];

    List<PieChartSectionData> chartSections(List<SectorModel> sectors) {
      final List<PieChartSectionData> list = [];
      for (var sector in sectors) {
        const double radius = 50.0;
        final data = PieChartSectionData(
          color: sector.color,
          value: sector.value,
          showTitle: false,
          radius: radius,
        );
        list.add(data);
      }
      return list;
    }

    return PieChart(
      PieChartData(
        sections: chartSections(sectors),
        centerSpaceRadius: 48.0,
      ),
    );
  }
}
