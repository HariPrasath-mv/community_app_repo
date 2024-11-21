class PaymentData {
  // Singleton instance
  static final PaymentData _instance = PaymentData._internal();

  factory PaymentData() {
    return _instance;
  }

  PaymentData._internal();

  // Store the total balance
  double totalBalance = 5300;
}
