import 'package:cryptop/models/order_model.dart';

class StopLimitOrder extends Order {
  double? limit;
  double? stop;
  bool? isPending;
  String? type;

  StopLimitOrder({
    type,
    stop = 0.0,
    limit = 0.0,
    isPending = true,
    id,
    amount = 0.0,
    openDate,
    closeDate,
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
          isClose: isClose,
          isOpen: isOpen,
          rate: rate,
          symbol: symbol,
        ) {
    this.stop = stop;
    this.type = type;
    this.limit = limit;
    this.isPending = isPending;
  }

  StopLimitOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.stop = double.parse(json['stop'].toString());
    this.limit = double.parse(json['limit'].toString());
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        'stop': stop,
        'limit': limit,
        'isPending': isPending,
      };
}
