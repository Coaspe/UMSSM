class Payment {
  const Payment(
      {required this.user,
      required this.price,
      required List<String> users,
      required this.time,
      required this.where,
      required this.what,
      this.memo = "",
      this.currency = Currency.won,
      this.consent = const {},
      this.receiptImg,
      this.permission = PaymentStatus.pending});
  final String user;
  final double price;
  final Currency currency;
  final String where;
  final String what;
  final String? memo;
  final String? receiptImg;
  final int time;

  /// Represents that this [Payment]'s status
  final PaymentStatus permission;

  /// Variable represents who approved, pending, rejected this [Payment]
  final Map<String, PaymentStatus> consent;
}

enum PaymentStatus { approved, pending, rejected }

enum Currency { won, dollor }
