class Alert {
  final String? symbol;
  final String? type;
  final double? value;
  final bool? status;
  final bool? hiden;

  Alert({
    this.type,
    this.value,
    this.hiden = false,
    this.status = true,
    this.symbol,
  });
  Alert.fromJson(Map<String, dynamic> json)
      : this(
          symbol: json['symbol'],
          hiden: json['hiden'],
          status: json['status'],
          type: json['type'],
          value: json['value'],
        );

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'hiden': hiden,
        'status': status,
        'type': type,
        'value': value,
      };
}
