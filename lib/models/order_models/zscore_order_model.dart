import 'package:cryptop/models/order_model.dart';

class ZscoreOrder extends Order {
  double? zscore;

  ZscoreOrder({
    this.zscore,
    id,
    amount = 0.0,
    type,
    price,
    pending,
    date,
    op,
    status,
    qAmount,
    symbol,
  }) : super(
          id: id,
          amount: amount,
          status: status,
          op: op,
          type: type,
          price: price,
          pending: pending,
          qAmount: qAmount,
          date: date,
          symbol: symbol,
        );

  ZscoreOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.zscore = json['zscore'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'zscore': zscore,
      };
}
