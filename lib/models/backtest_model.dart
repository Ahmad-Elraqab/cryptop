class BacktestModel {
  String? id;
  String? title;
  String? interval;
  String? type;
  bool? status;
  double? buyOn;
  double? sellOn;
  double? stopLose;
  double? amount;
  double? profit;
  double? sellRate;
  int? successfulOrders;
  int? failedOrders;
  int? numberOfTrades;
  int? numberOfSimultaneousTrades;
  List<String>? symbols;
  DateTime? startDate;
  DateTime? endDate;

  BacktestModel(
      {this.amount,
      this.status,
      this.endDate,
      this.title,
      this.id,
      this.successfulOrders,
      this.failedOrders,
      this.buyOn,
      this.stopLose,
      this.sellOn,
      this.type,
      this.sellRate,
      this.interval,
      this.numberOfSimultaneousTrades,
      this.numberOfTrades,
      this.startDate,
      this.symbols,
      this.profit});

  BacktestModel.fromJson(Map<String, dynamic> json)
      : this(
          amount: json['amount'].toDouble(),
          sellRate: json['sellRate'].toDouble(),
          profit: json['profit'].toDouble(),
          status: json['status'],
          sellOn: json['sellOn'].toDouble(),
          buyOn: json['buyOn'].toDouble(),
          stopLose: json['stopLose'].toDouble(),
          endDate: DateTime.parse(json['endDate']),
          startDate: DateTime.parse(json['startDate']),
          id: json['id'],
          title: json['title'],
          type: json['type'],
          failedOrders: json['failedOrders'],
          successfulOrders: json['successfulOrders'],
          interval: json['interval'],
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
        'title': title,
        'amount': amount,
        'stopLose': stopLose,
        'buyOn': buyOn,
        'sellOn': sellOn,
        'successfulOrders': successfulOrders,
        'failedOrders': failedOrders,
        'type': type,
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
      };
}
