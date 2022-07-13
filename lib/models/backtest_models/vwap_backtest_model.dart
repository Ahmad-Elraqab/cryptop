import 'package:cryptop/models/backtest_model.dart';

class VWAPBacktestModel extends BacktestModel {
  double? buyOn;
  double? sellOn;
  List<Map<String, dynamic>>? orderList;
  String? type;

  VWAPBacktestModel({
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
          endDate: endDate,
          id: id,
          sellRate: sellRate,
          interval: interval,
          numberOfSimultaneousTrades: numberOfSimultaneousTrades,
          numberOfTrades: numberOfTrades,
          startDate: startDate,
          symbols: symbols,
        );

  VWAPBacktestModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.buyOn = json['buyOn'].toDouble();
    this.sellOn = json['sellOn'].toDouble();
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => e as Map<String, dynamic>).toList();
  }
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyOn': buyOn,
        'sellOn': sellOn,
        'type': type,
      };
}
