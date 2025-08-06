String getPaymentCategory(int paymentCategory) {
  return switch (paymentCategory) {
    1 => "現金",
    2 => "メインバンク",
    3 => "クレジットカード",
    4 => "証券口座",
    int() => throw UnimplementedError(),
  };
}
