String getIncomeCategory(int category) {
  return switch (category) {
    1 => "給与",
    2 => "ボーナス",
    3 => "副業",
    4 => "証券",
    5 => "その他収入",
    int() => throw UnimplementedError(),
  };
}
