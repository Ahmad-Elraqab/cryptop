class Alert {
  final String? symbol;
  final String? type;
  final String? id;
  final double? value;
  final bool? status;
  final bool? hiden;

  Alert({
    this.id,
    this.type,
    this.value,
    this.hiden = false,
    this.status = true,
    this.symbol,
  });
  Alert.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          symbol: json['symbol'],
          hiden: json['hiden'],
          status: json['status'],
          type: json['type'],
          value: double.parse(json['value'].toString()),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'hiden': hiden,
        'status': status,
        'type': type,
        'value': value,
      };
}
