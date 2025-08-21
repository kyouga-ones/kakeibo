import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';
import 'package:kakeibo/features/graph/widget/details_list_view.dart';
import 'package:kakeibo/features/graph/widget/expenditure_chart.dart';

class ChartCard extends StatelessWidget {
  final Map<int, double> categoryDetailsMap;
  final List<SectorModel> sectors;
  final int total;

  const ChartCard({
    super.key,
    required this.categoryDetailsMap,
    required this.sectors,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'カテゴリ別支出',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(64),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: ExpenditureChart(sectors: sectors),
                  ),
                  Column(
                    children: [
                      Text(
                        getAmountFormat(total, 1),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('総支出'),
                    ],
                  ),
                ],
              ),
              Gap(64),
              Text(
                'カテゴリ別詳細',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DetailsListView(
                categoryDetailsMap: categoryDetailsMap,
                total: total,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
