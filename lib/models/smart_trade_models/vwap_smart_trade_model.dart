import 'package:cryptop/models/order_models/vwap_order_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';

class VWAPModel extends SmartTradeModel {
  double? buyVWAP;
  double? sellVWAP;
  List<VWAPOrder>? orderList;
  String? type;

  VWAPModel({
    this.buyVWAP,
    this.sellVWAP,
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

  VWAPModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.buyVWAP = json['buyVWAP'];
    this.sellVWAP = json['sellVWAP'];
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => VWAPOrder.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyVWAP': buyVWAP,
        'sellVWAP': sellVWAP,
        'type': type,
      };
}
