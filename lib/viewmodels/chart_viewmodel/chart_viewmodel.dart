import 'dart:convert';
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

  List tickers = [];
  List<Candle>? candles = [];

  String? coin;
  String? interval = '1m';

  setCoin(value) => coin = value;
  setInterval(value) => coin = value;

  Future<List<Chart>> getChartList() async {
    final chartList = await rest.getChartList(chartList: list);

    return chartList!;
  }

  Future<List?> get24Ticker() async {
    tickers = await rest.get24Ticker();

    return tickers;
  }

  List sort(index, value) {
    final data = tickers;

    if (value != null && tickers.isNotEmpty) {
      final json = jsonDecode(value);
      final Chart coin = data
          .where((element) => element.symbol == json['data']['s'])
          .toList()[0];

      coin.rate = double.parse(json['data']['P']);
      coin.lastPrice = double.parse(json['data']['c']);
      coin.volume = double.parse(json['data']['v']);

      data.sort((a, b) {
        if (index == 0) {
          return a.rate.compareTo(b.rate);
        } else if (index == 1) {
          return b.rate.compareTo(a.rate);
        } else {
          return b.volume.compareTo(a.volume);
        }
      });
      return data;
    }

    return data;
  }

  Future<List<Candle>> fetchCandles() async {
    candles = await rest.fetchCandles(coin!, interval!);

    return candles!;
  }

  void updateCandle(value) {
    final data = value['data']['k'];
    final date1 = DateTime.fromMillisecondsSinceEpoch(value['data']['k']['t']);
    final date2 = candles![0].date.toLocal();
    final obj = Candle(
        date: date1,
        high: double.parse(data['h']),
        low: double.parse(data['l']),
        open: double.parse(data['o']),
        close: double.parse(data['c']),
        volume: double.parse(data['v']));
    if (date1 == date2) {
      candles![0] = obj;
    } else {
      candles!.insert(0, obj);
    }
  }
}
