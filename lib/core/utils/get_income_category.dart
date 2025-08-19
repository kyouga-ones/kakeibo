String getIncomeCategory(int category) {
  return switch (category) {
    0 => "給与",
    1 => "ボーナス",
    2 => "副業",
    3 => "証券",
    4 => "その他収入",
    int() => throw UnimplementedError(),
  };
}
