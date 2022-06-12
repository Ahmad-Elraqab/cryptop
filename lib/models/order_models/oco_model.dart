import 'package:cryptop/models/order_model.dart';

class OCOOrder extends Order {
  double? limit;
  double? stop;
  double? s_limit;

  OCOOrder({
    this.s_limit = 0.0,
    this.stop = 0.0,
    this.limit = 0.0,
    id,
    amount = 0.0,
    date,
    price,
    pending,
    op,
    status,
    qAmount,
    type,
    symbol,
  }) : super(
          id: id,
          amount: amount,
          op: op,
          type: type,
          status: status,
          price: price,
          pending: pending,
          qAmount: qAmount,
          date: date,
          symbol: symbol,
        );

  OCOOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.s_limit = double.parse(json['s_limit'].toString());
    this.stop = double.parse(json['stop'].toString());
    this.limit = double.parse(json['limit'].toString());
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        's_limit': s_limit,
        'stop': stop,
        'limit': limit,
      };
}
