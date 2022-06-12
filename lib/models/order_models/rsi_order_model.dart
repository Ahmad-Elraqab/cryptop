import 'package:cryptop/models/order_model.dart';

class RSIOrder extends Order {
  double? rsi;

  RSIOrder({
    this.rsi,
    id,
    amount = 0.0,
    date,
    type,
    status,
    pending,
    price,
    symbol,
    op,
    qAmount,
  }) : super(
          id: id,
          amount: amount,
          op: op,
          status: status,
          type: type,
          price: price,
          pending: pending,
          qAmount: qAmount,
          date: date,
          symbol: symbol,
        );

  RSIOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.rsi = json['rsi'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'rsi': rsi,
      };
}
