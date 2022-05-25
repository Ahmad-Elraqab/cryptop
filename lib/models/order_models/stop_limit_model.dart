import 'package:cryptop/models/order_model.dart';

class StopLimitOrder extends Order {
  double? limit;
  double? stop;
  bool? isPending;

  StopLimitOrder({
    stop,
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
          symbol: symbol,
        ) {
    this.stop = stop;
    this.limit = limit;
    this.isPending = isPending;
  }

  StopLimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.stop = json['stop'];
    this.limit = json['limit'];
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() => {};
}
