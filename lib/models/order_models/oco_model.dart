import 'package:cryptop/models/order_model.dart';

class OCOOrder extends Order {
  double? limit;
  double? stop;
  double? s_limit;
  bool? isPending;

  OCOOrder({
    s_limit,
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
    this.s_limit = s_limit;
    this.stop = stop;
    this.limit = limit;
    this.isPending = isPending;
  }

  OCOOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.s_limit = json['s_limit'];
    this.stop = json['stop'];
    this.limit = json['limit'];
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() => {};
}
