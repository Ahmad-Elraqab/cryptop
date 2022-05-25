class Order {
  String? symbol;
  double? buyPrice;
  DateTime? openDate;
  DateTime? closeDate;
  double? amount;
  bool? isOpen;
  bool? isClosed;
  double? rate;

  Order({
    this.amount,
    this.openDate,
    this.closeDate,
    this.buyPrice,
    this.isClosed,
    this.isOpen,
    this.rate,
    this.symbol,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          amount: json['amount'],
          openDate: json['openDate'],
          closeDate: json['closeDate'],
          buyPrice: json['buyPrice'],
          isClosed: json['isClosed'],
          isOpen: json['isOpen'],
          rate: json['rate'],
          symbol: json['symbol'],
        );

  Map<String, dynamic> toJson() => {};
}
