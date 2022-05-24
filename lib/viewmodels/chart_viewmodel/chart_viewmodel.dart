import 'package:candlesticks/candlesticks.dart';
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

  Chart? liveChart;
  List<Chart>? favoriteCharts;

  String? coin = 'BTCUSDT';
  String? interval = '4h';

  setCoin(value) {
    coin = value;
    notifyListeners();
  }

  setInterval(value) {
    interval = value;
    notifyListeners();
  }

  init() async {
    final list = await getChartList();
    liveChart = list.where((element) => element.symbol == 'BTCUSDT').first;
    notifyListeners();
  }

  Future<List<Chart>> getChartList() async {
    favoriteCharts = await rest.getChartList(chartList: list);

    return favoriteCharts!;
  }

  Future<Chart> fetchCandles() async {
    liveChart = await rest.fetchCandles(coin!, interval!);

    return liveChart!;
  }

  void updateCandle(value) {
    final data = value['data']['k'];
    final date1 = DateTime.fromMillisecondsSinceEpoch(value['data']['k']['t']);
    final date2 = liveChart!.candles![0].date.toLocal();
    final obj = Candle(
        date: date1,
        high: double.parse(data['h']),
        low: double.parse(data['l']),
        open: double.parse(data['o']),
        close: double.parse(data['c']),
        volume: double.parse(data['v']));
    if (date1 == date2) {
      liveChart!.candles![0] = obj;
    } else {
      liveChart!.candles!.insert(0, obj);
    }
  }
}
