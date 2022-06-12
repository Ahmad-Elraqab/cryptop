import 'package:cryptop/models/order_model.dart';

class LimitOrder extends Order {
  double? limit;

  LimitOrder({
    this.limit = 0.0,
    amount = 0.0,
    id,
    op,
    date,
    status,
    qAmount,
    pending,
    price,
    type,
    symbol,
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

  LimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.limit = double.parse(json['limit'].toString());
  }

  Map<String, dynamic> toJson() =>
      {...super.toJson(), 'type': type, 'limit': limit};
}
