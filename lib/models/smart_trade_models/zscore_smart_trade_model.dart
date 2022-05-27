import 'package:cryptop/models/order_models/zscore_order_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';

class ZscoreModel extends SmartTradeModel {
  double? buyZscore;
  double? sellZscore;
  String? type;
  List<ZscoreOrder>? orderList;

  ZscoreModel({
    this.buyZscore,
    this.sellZscore,
    this.type,
    this.orderList,
    amount,
    endDate,
    id,
    interval,
    isActive,
    numberOfSimultaneousTrades,
    numberOfTrades,
    startDate,
    symbols,
  }) : super(
          amount: amount,
          endDate: endDate,
          id: id,
          interval: interval,
          isActive: isActive,
          numberOfSimultaneousTrades: numberOfSimultaneousTrades,
          numberOfTrades: numberOfTrades,
          startDate: startDate,
          symbols: symbols,
        );

  ZscoreModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.buyZscore = json['buyZscore'];
    this.sellZscore = json['sellZscore'];
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => ZscoreOrder.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyZscore': buyZscore,
        'sellZscore': sellZscore,
        'type': type,
      };
}
