import 'package:cryptop/models/order_model.dart';

class LimitOrder extends Order {
  String? type;
  double? limit;
  bool? isPending;

  LimitOrder({
    type,
    limit = 0.0,
    isPending = true,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    symbol,
  }) : super(
            amount: amount,
            buyPrice: buyPrice,
            closeDate: closeDate,
            openDate: openDate,
            isClose: isClose,
            isOpen: isOpen,
            rate: rate,
            symbol: symbol) {
    this.limit = limit;
    this.type = type;
    this.isPending = isPending;
  }

  LimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.limit = double.parse(json['limit'].toString());
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() =>
      {...super.toJson(), 'type': type, 'limit': limit, 'isPending': isPending};
}
