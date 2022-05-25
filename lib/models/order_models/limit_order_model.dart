import 'package:cryptop/models/order_model.dart';

class LimitOrder extends Order {
  double? limit;
  bool? isPending;

  LimitOrder({
    limit,
    isPending,
    amount,
    openDate,
    closeDate,
    buyPrice,
    isClosed,
    isOpen,
    rate,
    symbol,
  }) : super(
            amount: amount,
            buyPrice: buyPrice,
            closeDate: closeDate,
            openDate: openDate,
            isClosed: isClosed,
            isOpen: isOpen,
            rate: rate,
            symbol: symbol) {
    this.limit = limit;
    this.isPending = isPending;
  }

  LimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.limit = json['limit'];
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() => {};
}
