import 'package:flutter/material.dart';
import 'package:kakeibo/core/utils/get_category.dart';
import 'package:kakeibo/features/graph/utils/get_pie_chart_color.dart';
import 'package:kakeibo/features/graph/utils/get_proportion.dart';
import 'package:kakeibo/features/graph/widget/category_card.dart';

class DetailsListView extends StatelessWidget {
  final Map<int, double> categoryDetailsMap;
  final int total;

  const DetailsListView({
    super.key,
    required this.categoryDetailsMap,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: categoryDetailsMap.entries.map((entry) {
        final category = entry.key;
        final value = entry.value;
        return CategoryCard(
          value: value.round(),
          title: getCategory(2, category),
          color: getPieChartColor(category),
          proportion: getProportion(value, total),
        );
      }).toList(),
    );
  }
}
