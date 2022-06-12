class Wallet {
  String? id;
  List<Coin>? coins;

  Wallet({this.coins, this.id});

  Wallet.fromJson(Map<String, dynamic> json)
      : this(
          coins: (json['pairs'] as Map)
              .keys
              .map((e) => Coin.fromJson(json['pairs'][e]))
              .toList(),
        );
}

class Coin {
  String? symbol;
  double? amount;
  double? qAmount;
  double? buyPrice;
  double? currentPrice;
  double? profit;

  Coin({
    this.symbol,
    this.amount,
    this.buyPrice,
    this.profit,
    this.currentPrice,
    this.qAmount,
  });
  Coin.fromJson(Map<String, dynamic> json)
      : this(
          amount: double.parse(json['amount'].toString()),
          buyPrice: double.parse(json['buyPrice'].toString()),
          qAmount: double.parse(json['coin'].toString()),
          symbol: json['symbol'],
          profit: 0.0,
          currentPrice: 0.0,
        );
}
