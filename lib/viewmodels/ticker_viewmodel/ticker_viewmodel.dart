import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/services/chart_service.dart';
import 'package:flutter/material.dart';

class TickerViewmodel extends ChangeNotifier {
  ChartService get rest => dependency();

  List<Ticker>? tickers;

  init() async {
    await get24Ticker();
    notifyListeners();
  }

  List<Ticker>? getSortedTicker(String index) {
    if (tickers != null)
      tickers!.sort((a, b) {
        switch (index) {
          case 'C_UP':
            return a.priceChangePercent!.compareTo(b.priceChangePercent!);
          case 'C_DOWN':
            return b.priceChangePercent!.compareTo(a.priceChangePercent!);
          case 'V_UP':
            return b.volume!.compareTo(a.volume!);
          case 'V_DOWN':
            return a.volume!.compareTo(b.volume!);
          case 'N_UP':
            return b.symbol!.compareTo(a.symbol!);
          case 'N_DOWN':
            return a.symbol!.compareTo(b.symbol!);
          default:
        }
        return a.symbol!.compareTo(b.symbol!);
      });
    return tickers;
  }

  Future<List<Ticker>?> get24Ticker() async {
    tickers = await rest.get24Ticker();

    return tickers;
  }

  void updateTickers(json) {
    if (json != null && tickers != null) {
      final Ticker coin = tickers!
          .where((element) => element.symbol == json['data']['s'])
          .toList()[0];

      coin.priceChangePercent = double.parse(json['data']['P']);
      coin.lastPrice = double.parse(json['data']['c']);
      coin.volume = double.parse(json['data']['v']);
    }
  }
}
