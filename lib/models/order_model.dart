class Order {
  String? symbol;
  double? buyPrice;
  DateTime? openDate;
  DateTime? closeDate;
  double? amount;
  bool? isOpen;
  bool? isClose;
  String? type;
  double? rate;

  Order({
    this.amount = 0.0,
    this.type = '',
    this.openDate,
    this.closeDate,
    this.buyPrice = 0.0,
    this.isClose = false,
    this.isOpen = true,
    this.rate = 0.0,
    this.symbol,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          type: json['type'],
          amount: double.parse(json['amount'].toString()),
          openDate: json['openDate'],
          closeDate: json['closeDate'],
          buyPrice: json['buyPrice'],
          isClose: json['isClose'],
          isOpen: json['isOpen'],
          rate: double.parse(json['rate'].toString()),
          symbol: json['symbol'],
        );

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'openDate': openDate,
        'closeDate': closeDate,
        'buyPrice': buyPrice,
        'isClosed': isClose,
        'isOpen': isOpen,
        'rate': rate,
        'symbol': symbol,
      };
}
