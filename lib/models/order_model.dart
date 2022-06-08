class Order {
  String? id;
  String? symbol;
  double? buyPrice;
  double? sellPrice;
  DateTime? openDate;
  DateTime? closeDate;
  double? amount;
  double? qAmount;
  bool? isOpen;
  bool? isClose;
  String? type;
  String? op;
  double? rate;

  Order({
    this.id,
    this.sellPrice,
    this.amount = 0.0,
    this.type = '',
    this.op,
    this.qAmount,
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
          op: json['op'],
          type: json['type'],
          qAmount: double.parse(json['qAmount'].toString()),
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
        'op': op,
        'qAmount': qAmount,
        'amount': amount,
        'buyPrice': buyPrice,
        'isClosed': isClose,
        'isOpen': isOpen,
        'rate': rate,
        'symbol': symbol,
      };
}
