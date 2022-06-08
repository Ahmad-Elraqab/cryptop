import 'package:cryptop/models/order_model.dart';

class StopLimitOrder extends Order {
  double? limit;
  double? stop;
  bool? isPending;
  String? type;

  StopLimitOrder({
    this.type,
    this.stop = 0.0,
    this.limit = 0.0,
    this.isPending = true,
    id,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    op,
    qAmount,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    symbol,
    sellPrice,
  }) : super(
          id: id,
          op: op,
          qAmount: qAmount,
          amount: amount,
          buyPrice: buyPrice,
          closeDate: closeDate,
          sellPrice: sellPrice,
          openDate: openDate,
          isClose: isClose,
          isOpen: isOpen,
          rate: rate,
          symbol: symbol,
        );

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
