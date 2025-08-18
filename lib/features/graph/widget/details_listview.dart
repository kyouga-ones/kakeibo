import 'package:flutter/material.dart';
import 'package:kakeibo/core/utils/get_category.dart';
import 'package:kakeibo/features/graph/utils/get_pie_chart_color.dart';
import 'package:kakeibo/features/graph/widget/category_card.dart';

class DetailsListview extends StatelessWidget {
  const DetailsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          CategoryCard(
            value: 10000,
            title: getCategory(2, 1),
            color: getPieChartColor(1),
          ),
          CategoryCard(
            value: 5000,
            title: getCategory(2, 2),
            color: getPieChartColor(2),
          ),
          CategoryCard(
            value: 500,
            title: getCategory(2, 3),
            color: getPieChartColor(3),
          ),
        ],
      ),
    );
  }
}
