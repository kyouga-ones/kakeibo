import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kakeibo/core/models/sector_model.dart';
import 'package:kakeibo/core/utils/get_amount_format.dart';
import 'package:kakeibo/features/graph/widget/details_listview.dart';
import 'package:kakeibo/features/graph/widget/expenditure_chart.dart';

class ChartCard extends StatelessWidget {
  final Map<int, double> categoryDetailsLMap;
  final List<SectorModel> sectors;

  const ChartCard({
    super.key,
    required this.categoryDetailsLMap,
    required this.sectors,
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
                        getAmountFormat(
                          categoryDetailsLMap.values.fold(
                            0,
                            (sum, value) => sum + value.round(),
                          ),
                          1,
                        ),
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
              DetailsListview(),
            ],
          ),
        ),
      ),
    );
  }
}
