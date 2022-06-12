import 'package:cryptop/models/order_model.dart';

class StopLimitOrder extends Order {
  double? limit;
  double? stop;

  StopLimitOrder({
    this.stop = 0.0,
    this.limit = 0.0,
    id,
    amount = 0.0,
    date,
    type,
    price,
    pending,
    op,
    status,
    qAmount,
    symbol,
  }) : super(
          id: id,
          status: status,
          amount: amount,
          op: op,
          type: type,
          price: price,
          pending: pending,
          qAmount: qAmount,
          date: date,
          symbol: symbol,
        );

  StopLimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.stop = double.parse(json['stop'].toString());
    this.limit = double.parse(json['limit'].toString());
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'stop': stop,
        'limit': limit,
      };
}
