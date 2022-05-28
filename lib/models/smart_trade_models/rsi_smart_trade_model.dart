import 'package:cryptop/models/order_models/rsi_order_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';

class RSIModel extends SmartTradeModel {
  double? buyOn;
  double? sellOn;
  List<RSIOrder>? orderList;
  String? type;

  RSIModel({
    this.buyOn,
    this.sellOn,
    this.type,
    this.orderList,
    amount,
    endDate,
    id,
    interval,
    sellRate,
    isActive,
    numberOfSimultaneousTrades,
    numberOfTrades,
    startDate,
    symbols,
  }) : super(
          amount: amount,
          sellRate: sellRate,
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
    this.buyOn = json['buyOn'].toDouble();
    this.sellOn = json['sellOn'].toDouble();
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => RSIOrder.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyOn': buyOn,
        'sellOn': sellOn,
        'type': type,
      };
}
