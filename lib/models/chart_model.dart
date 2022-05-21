import 'package:candlesticks/candlesticks.dart';

class Chart {
  String? symbol;
  String? interval;
  List<Candle>? candles;

  Chart({
    this.candles,
    this.symbol,
    this.interval,
  });

  Chart.fromJson(Map<String, dynamic> json)
      : this(
          symbol: json['symbol'],
          interval: json['interval'],
          candles: (json['candles'] as List)
              .map((e) => Candle.fromJson(e))
              .toList()
              .reversed
              .toList(),
        );

  Map<String, dynamic> toJson() => {};
}
