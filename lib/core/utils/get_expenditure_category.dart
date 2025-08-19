String getExpenditureCategory(int category) {
  return switch (category) {
    0 => "食費",
    1 => "住居費",
    2 => "交通費",
    3 => "光熱費",
    4 => "通信費",
    5 => "医療費",
    6 => "教育費",
    7 => "娯楽費",
    8 => "衣類費",
    9 => "その他支出",
    int() => throw UnimplementedError(),
  };
}
