import 'package:cryptop/models/order_model.dart';

class ZscoreOrder extends Order {
  double? buyZscore;
  double? sellZscore;

  ZscoreOrder({
    this.buyZscore,
    this.sellZscore,
    id,
    amount = 0.0,
    openDate,
    closeDate,
    buyPrice = 0.0,
    isClose = false,
    isOpen = true,
    op,
    qAmount,
    rate = 0.0,
    sellPrice,
    symbol,
  }) : super(
          id: id,
          op: op,
          qAmount: qAmount,
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

  ZscoreOrder.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.type = json['type'];
    this.buyZscore = json['buyZscore'];
    this.sellZscore = json['sellZscore'];
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        'sellZscore': sellZscore,
        'buyZscore': buyZscore,
      };
}
