class Payment {
  Payment({
    required this.userEmail,
    required this.price,
    required List<String> users,
    required this.time,
    this.memo = "",
    this.currency = Currency.won,
    this.consent = const {},
    this.receiptImg,
  }) {
    if (consent == {}) consent = {for (var i in users) i: false};
  }
  final String userEmail;
  final double price;
  final Currency currency;
  final String? memo;
  final String? receiptImg;
  final int time;
  Map<String, bool> consent;
}

enum PaymentPermission { approved, pending, rejected }

enum Currency { won, dollor }
