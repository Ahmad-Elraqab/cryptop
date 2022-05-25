import 'package:cryptop/models/order_model.dart';

class OCOOrder extends Order {
  String? type;
  double? limit;
  double? stop;
  double? s_limit;
  bool? isPending;

  OCOOrder({
    s_limit = 0.0,
    stop = 0.0,
    limit = 0.0,
    isPending = true,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    type,
    symbol,
  }) : super(
          amount: amount,
          buyPrice: buyPrice,
          closeDate: closeDate,
          openDate: openDate,
          isClose: isClose,
          isOpen: isOpen,
          rate: rate,
          symbol: symbol,
        ) {
    this.s_limit = s_limit;
    this.stop = stop;
    this.type = type;
    this.limit = limit;
    this.isPending = isPending;
  }

  OCOOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.s_limit = double.parse(json['s_limit'].toString());
    this.stop = double.parse(json['stop'].toString());
    this.limit = double.parse(json['limit'].toString());
    this.isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        's_limit': s_limit,
        'stop': stop,
        'limit': limit,
        'isPending': isPending,
      };
}
