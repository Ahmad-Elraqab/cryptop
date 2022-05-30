import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/models/order_models/zscore_order_model.dart';

class ZscoreBacktestModel extends BacktestModel {
  double? buyOn;
  double? sellOn;
  String? type;
  List<ZscoreOrder>? orderList;

  ZscoreBacktestModel({
    this.buyOn,
    this.sellOn,
    this.type,
    this.orderList,
    amount,
    endDate,
    sellRate,
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
          numberOfSimultaneousTrades: numberOfSimultaneousTrades,
          numberOfTrades: numberOfTrades,
          sellRate: sellRate,
          startDate: startDate,
          symbols: symbols,
        );

  ZscoreBacktestModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    this.buyOn = json['buyOn'].toDouble();
    this.sellOn = json['sellOn'].toDouble();
    this.type = json['type'];
    this.orderList =
        (json['orders'] as List).map((e) => ZscoreOrder.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'buyOn': buyOn,
        'sellOn': sellOn,
        'type': type,
      };
}
