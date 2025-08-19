import 'package:flutter/widgets.dart';

Color getPieChartColor(int category) {
  return switch (category) {
    0 => Color(0xFFE41A1C),
    1 => Color(0xFF377EB8),
    2 => Color(0xFF4DAF4A),
    3 => Color(0xFFFF7F00),
    4 => Color(0xFF984EA3),
    5 => Color(0xFFFFE119),
    6 => Color(0xFFA65628),
    7 => Color(0xFFF781BF),
    8 => Color(0xFF66C2A5),
    9 => Color(0xFF999999),
    int() => throw UnimplementedError(),
  };
}
