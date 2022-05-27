import 'package:cryptop/models/order_models/rsi_order_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';

class RSIModel extends SmartTradeModel {
  double? buyRSI;
  double? sellRSI;
  List<RSIOrder>? orderList;
  String? type;

  RSIModel({
    this.buyRSI,
    this.sellRSI,
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

  RSIModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.buyRSI = json['buyRSI'];
    this.sellRSI = json['sellRSI'];
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => RSIOrder.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyRSI': buyRSI,
        'sellRSI': sellRSI,
        'type': type,
      };
}
