import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/services/chart_service.dart';
import 'package:flutter/material.dart';

class TickerViewmodel extends ChangeNotifier {
  ChartService get rest => dependency();

  List<Ticker>? tickers;

  getSortedTicker(index) {
    if (tickers != null)
      tickers!.sort((a, b) {
        if (index == 0) {
          return a.priceChangePercent!.compareTo(b.priceChangePercent!);
        } else if (index == 1) {
          return b.priceChangePercent!.compareTo(a.priceChangePercent!);
        } else {
          return b.volume!.compareTo(a.volume!);
        }
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

      // return a.priceChangePercent!.compareTo(b.priceChangePercent!);

    }
  }
}