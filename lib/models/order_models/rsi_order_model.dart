import 'package:cryptop/models/order_model.dart';

class RSIOrder extends Order {
  double? buyRSI;
  double? sellRSI;

  RSIOrder({
    this.buyRSI,
    this.sellRSI,
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
          sellPrice: sellPrice,
          closeDate: closeDate,
          openDate: openDate,
          isClose: isClose,
          isOpen: isOpen,
          rate: rate,
          symbol: symbol,
        );

  RSIOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.buyRSI = json['buyRSI'].toDouble();
    this.sellRSI = json['sellRSI'].toDouble();
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        'sellRSI': sellRSI,
        'buyRSI': buyRSI,
      };
}
