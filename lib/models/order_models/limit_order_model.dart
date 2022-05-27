import 'package:cryptop/models/order_model.dart';

class LimitOrder extends Order {
  String? type;
  double? limit;
  bool? isPending;

  LimitOrder({
    this.type,
    this.limit = 0.0,
    this.isPending = true,
    amount = 0.0,
    openDate,
    closeDate,
    sellPrice,
    id,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    symbol,
  }) : super(
            id: id,
            amount: amount,
            buyPrice: buyPrice,
            closeDate: closeDate,
            openDate: openDate,
            sellPrice: sellPrice,
            isClose: isClose,
            isOpen: isOpen,
            rate: rate,
            symbol: symbol);

  LimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.limit = double.parse(json['limit'].toString());
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() =>
      {...super.toJson(), 'type': type, 'limit': limit, 'isPending': isPending};
}
