import 'package:cryptop/models/order_model.dart';

class OCOOrder extends Order {
  String? type;
  double? limit;
  double? stop;
  double? s_limit;
  bool? isPending;

  OCOOrder({
    this.s_limit = 0.0,
    this.isPending = true,
    this.stop = 0.0,
    this.limit = 0.0,
    this.type,
    id,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    sellPrice,
    op,
    qAmount,
    symbol,
  }) : super(
          id: id,
          amount: amount,
          op: op,
          qAmount: qAmount,
          buyPrice: buyPrice,
          closeDate: closeDate,
          sellPrice: sellPrice,
          openDate: openDate,
          isClose: isClose,
          isOpen: isOpen,
          rate: rate,
          symbol: symbol,
        );

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
