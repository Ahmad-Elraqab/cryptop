import 'package:cryptop/models/order_model.dart';

class VWAPOrder extends Order {
  double? buyVWAP;
  double? sellVWAP;

  VWAPOrder({
    this.buyVWAP,
    this.sellVWAP,
    id,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    rate = 0.0,
    sellPrice,
    symbol,
  }) : super(
          id: id,
          amount: amount,
          buyPrice: buyPrice,
          closeDate: closeDate,
          openDate: openDate,
          isClose: isClose,
          isOpen: isOpen,
          sellPrice: sellPrice,
          rate: rate,
          symbol: symbol,
        );

  VWAPOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.buyVWAP = json['buyVWAP'];
    this.sellVWAP = json['sellVWAP'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        'sellVWAP': sellVWAP,
        'buyVWAP': buyVWAP,
      };
}
