import 'package:ssm/src/models/payment.dart';

class Settlement {
  const Settlement(
      {required this.title,
      this.users = const [],
      this.payments = const [],
      this.desc = ""});
  final String title;
  final List<String> users;
  final List<Payment> payments;
  final String desc;

  Map<Currency, double> get totalPayment {
    Map<Currency, double> retVal = {};
    for (var pay in payments) {
      if (retVal[pay.currency] == null) {
        retVal[pay.currency] = pay.price;
      } else {
        retVal[pay.currency] = retVal[pay.currency]! + pay.price;
      }
    }
    return retVal;
  }
}

extension on Iterable<List<Payment>> {
  double sum() {
    double x = 0;
    for (var ele in this) {
      for (var p in ele) {
        x += p.price;
      }
    }
    return x;
  }
}
