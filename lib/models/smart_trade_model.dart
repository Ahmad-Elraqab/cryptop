class SmartTradeModel {
  String? id;
  String? interval;
  bool? isActive;
  double? amount;
  double? profit;
  int? numberOfTrades;
  int? numberOfSimultaneousTrades;
  List<String>? symbols;
  DateTime? startDate;
  DateTime? endDate;

  SmartTradeModel(
      {this.amount,
      this.endDate,
      this.id,
      this.interval,
      this.isActive,
      this.numberOfSimultaneousTrades,
      this.numberOfTrades,
      this.startDate,
      this.symbols,
      this.profit});

  SmartTradeModel.fromJson(Map<String, dynamic> json)
      : this(
          amount: json['amount'],
          endDate: json['endDate'],
          id: json['id'],
          profit: json['profit'],
          interval: json['interval'],
          isActive: json['isActive'],
          numberOfSimultaneousTrades: json['numberOfSimultaneousTrades'],
          numberOfTrades: json['numberOfTrades'],
          startDate: json['startDate'],
          symbols: json['symbols'],
        );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'endDate': endDate,
        'id': id,
        'interval': interval,
        'isActive': isActive,
        'numberOfSimultaneousTrades': numberOfSimultaneousTrades,
        'numberOfTrades': numberOfTrades,
        'startDate': startDate,
        'symbols': symbols,
      };
}
