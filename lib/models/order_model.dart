class Order {
  String? id;
  String? symbol;
  double? buyPrice;
  double? sellPrice;
  DateTime? openDate;
  DateTime? closeDate;
  double? amount;
  bool? isOpen;
  bool? isClose;
  String? type;
  double? rate;

  Order({
    this.id,
    this.sellPrice,
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
          id: json['id'],
          type: json['type'],
          amount: double.parse(json['amount'].toString()),
          openDate: DateTime.parse(json['openDate']),
          closeDate: DateTime.parse(json['closeDate']),
          buyPrice: (json['buyPrice'] + 0.0),
          sellPrice: (json['sellPrice'] + 0.0),
          isClose: json['isClose'],
          isOpen: json['isOpen'],
          rate: double.parse(json['rate'].toString()),
          symbol: json['symbol'],
        );

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'buyPrice': buyPrice,
        'isClosed': isClose,
        'isOpen': isOpen,
        'rate': rate,
        'symbol': symbol,
      };
}
