import 'package:flutter/widgets.dart';

Color getPieChartColor(int category) {
  return switch (category) {
    1 => Color(0xFFE41A1C),
    2 => Color(0xFF377EB8),
    3 => Color(0xFF4DAF4A),
    4 => Color(0xFFFF7F00),
    5 => Color(0xFF984EA3),
    6 => Color(0xFFFFE119),
    7 => Color(0xFFA65628),
    8 => Color(0xFFF781BF),
    9 => Color(0xFF66C2A5),
    10 => Color(0xFF999999),
    int() => throw UnimplementedError(),
  };
}
