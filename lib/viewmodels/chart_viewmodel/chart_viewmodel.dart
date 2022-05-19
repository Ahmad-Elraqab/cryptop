import 'dart:convert';
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
}
