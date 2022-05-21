class Ticker {
  String? symbol;
  double? priceChangePercent;
  double? lastPrice;
  double? volume;
  double? quoteVolume;
  Ticker({
    this.lastPrice,
    this.quoteVolume,
    this.symbol,
    this.volume,
    this.priceChangePercent,
  });

  Ticker.fromJson(Map<String, dynamic> json)
      : this(
          symbol: json['symbol'],
          lastPrice: double.parse(json['lastPrice']),
          priceChangePercent: double.parse(json['priceChangePercent']),
          quoteVolume: double.parse(json['quoteVolume']),
          volume: double.parse(json['volume']),
        );

  Map<String, dynamic> toJson() => {};
}
