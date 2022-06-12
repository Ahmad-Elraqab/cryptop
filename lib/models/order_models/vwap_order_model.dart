import 'package:cryptop/models/order_model.dart';

class VWAPOrder extends Order {
  double? vwap;

  VWAPOrder({
    this.vwap,
    id,
    amount = 0.0,
    date,
    status,
    type,
    price,
    pending,
    symbol,
    op,
    qAmount,
  }) : super(
          id: id,
          amount: amount,
          op: op,
          type: type,
          price: price,
          status: status,
          pending: pending,
          qAmount: qAmount,
          date: date,
          symbol: symbol,
        );

  VWAPOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.vwap = json['vwap'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'vwap': vwap,
      };
}
