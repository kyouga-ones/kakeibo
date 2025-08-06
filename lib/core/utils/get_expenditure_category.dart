String getExpenditureCategory(int category) {
  return switch (category) {
    1 => "食費",
    2 => "住居費",
    3 => "交通費",
    4 => "光熱費",
    5 => "通信費",
    6 => "医療費",
    7 => "教育費",
    8 => "娯楽費",
    9 => "衣類費",
    10 => "その他支出",
    int() => throw UnimplementedError(),
  };
}
