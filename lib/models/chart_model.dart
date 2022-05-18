import 'package:fl_chart/fl_chart.dart';

class Chart {
  String? symbol;
  double? rate;
  String? interval;
  double? volume;
  double? lastPrice;
  List<FlSpot>? candles;

  Chart({
    this.symbol,
    this.lastPrice,
    this.interval,
    this.rate,
    this.volume,
    this.candles,
  });

  Chart.fromJson(Map<String, dynamic> json)
      : this(
          lastPrice:
              json['lastPrice'] == null ? 0 : double.parse(json['lastPrice']),
          volume: json['volume'] == null ? 0 : double.parse(json['volume']),
          symbol: json['symbol'],
          interval: json['interval'],
          rate: double.parse(json['priceChangePercent'].toString()),
          candles: json['data'] == null
              ? []
              : (json['data'] as List)
                  .map((e) => FlSpot(double.parse(e['date'].toString()),
                      double.parse(e['price'])))
                  .toList(),
        );

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'interval': interval,
        'rate': rate,
        'candles': candles,
      };
}
