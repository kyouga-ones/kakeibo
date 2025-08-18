import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/sector_model.dart';

class ExpenditureChart extends StatelessWidget {
  final List<SectorModel> sectors;

  const ExpenditureChart({
    super.key,
    required this.sectors,
  });

  @override
  Widget build(BuildContext context) {
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
        sections: chartSections(
          (sectors.isNotEmpty)
              ? sectors
              : [SectorModel(color: Colors.grey, value: 1)],
        ),
        centerSpaceRadius: 48.0,
      ),
    );
  }
}
