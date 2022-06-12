class Order {
  String? id;
  String? symbol;
  double? price;
  DateTime? date;
  double? amount;
  double? qAmount;
  bool? pending;
  String? type;
  String? status;
  String? op;

  Order({
    this.id,
    this.amount = 0.0,
    this.type = '',
    this.op,
    this.status,
    this.date,
    this.pending,
    this.price,
    this.qAmount,
    this.symbol,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          op: json['op'],
          type: json['type'],
          pending: json['pending'],
          status: json['status'],
          qAmount: double.parse(json['qAmount'].toString()),
          amount: double.parse(json['amount'].toString()),
          price: double.parse(json['price'].toString()),
          date: DateTime.parse(json['date']),
          symbol: json['symbol'],
        );

  Map<String, dynamic> toJson() => {
        'type': type,
        'op': op,
        'pending': pending,
        'price': price,
        'status': status,
        'qAmount': qAmount,
        'amount': amount,
        'symbol': symbol,
      };
}
