import 'package:fl_chart/fl_chart.dart';

class Chart {
  String? symbol;
  double? rate;
  String? interval;
  List<FlSpot>? candles;

  Chart({
    this.symbol,
    this.interval,
    this.rate,
    this.candles,
  });

  Chart.fromJson(Map<String, dynamic> json)
      : this(
          symbol: json['symbol'],
          interval: json['interval'],
          rate: json['rate'].toDouble(),
          candles: (json['data'] as List)
              .map((e) => FlSpot(
                  double.parse(e['date'].toString()), double.parse(e['price'])))
              .toList(),
        );

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'interval': interval,
        'rate': rate,
        'candles': candles,
      };
}
