import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/services/chart_service.dart';
import 'package:flutter/cupertino.dart';

class ChartViewmodel extends ChangeNotifier {
  final list = [
    {'symbol': 'BTCUSDT', 'interval': '4h'},
    {'symbol': 'ETHUSDT', 'interval': '4h'},
    {'symbol': 'SOLUSDT', 'interval': '4h'},
    {'symbol': 'BNBUSDT', 'interval': '4h'},
    {'symbol': 'XRPUSDT', 'interval': '4h'}
  ];
  ChartService get rest => dependency();

  Future<List<Chart>> getChartList() async {
    final chartList = await rest.getChartList(chartList: list);

    return chartList!;
  }

  Future<List?> get24Ticker() async {
    final chartList = await rest.get24Ticker();

    return chartList!;
  }
}
