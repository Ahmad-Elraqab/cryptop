class SmartTradeModel {
  String? id;
  String? interval;
  String? type;
  bool? isActive;
  bool? isClose;
  double? buyOn;
  double? sellOn;
  double? stopLose;
  double? amount;
  double? profit;
  double? sellRate;
  int? numberOfTrades;
  int? numberOfSimultaneousTrades;
  List<String>? symbols;
  DateTime? startDate;
  DateTime? endDate;

  SmartTradeModel(
      {this.amount,
      this.endDate,
      this.id,
      this.buyOn,
      this.stopLose,
      this.sellOn,
      this.isClose,
      this.type,
      this.sellRate,
      this.interval,
      this.isActive,
      this.numberOfSimultaneousTrades,
      this.numberOfTrades,
      this.startDate,
      this.symbols,
      this.profit});

  SmartTradeModel.fromJson(Map<String, dynamic> json)
      : this(
          amount: json['amount'].toDouble(),
          sellRate: json['sellRate'].toDouble(),
          profit: json['profit'].toDouble(),
          sellOn: json['sellOn'].toDouble(),
          buyOn: json['buyOn'].toDouble(),
          stopLose: json['stopLose'].toDouble(),
          endDate: DateTime.parse(json['endDate']),
          startDate: DateTime.parse(json['startDate']),
          id: json['id'],
          type: json['type'],
          interval: json['interval'],
          isActive: json['isActive'],
          isClose: json['isClose'],
          numberOfSimultaneousTrades: json['numberOfSimultaneousTrades'],
          numberOfTrades: json['numberOfTrades'],
          symbols: (json['symbols'] as List).map((e) => e.toString()).toList(),
        );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'id': id,
        'interval': interval,
        'numberOfSimultaneousTrades': numberOfSimultaneousTrades,
        'numberOfTrades': numberOfTrades,
        'symbols': symbols,
        'sellRate': sellRate,
        'amount': amount,
        'buyOn': buyOn,
        'sellOn': sellOn,
        'type': type,
      };
}
