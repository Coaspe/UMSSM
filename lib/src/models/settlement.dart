import 'package:ssm/src/models/payment.dart';

class Settlement {
  const Settlement(
      {required this.title, this.users = const [], this.payments = const {}});
  final String title;
  final List<String> users;
  final Map<String, List<Payment>> payments;
  Map<Currency, double> get totalPayment {
    Map<Currency, double> retVal = {};
    for (var user in payments.values) {
      for (var pay in user) {
        if (retVal[pay.currency] == null) {
          retVal[pay.currency] = pay.price;
        } else {
          retVal[pay.currency] = retVal[pay.currency]! + pay.price;
        }
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
