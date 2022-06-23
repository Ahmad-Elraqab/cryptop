import 'package:cryptop/models/wallet_model.dart';

class User {
  String? id;
  String? name;
  String? gender;
  String? phoneNumber;
  String? email;
  String? password;
  String? username;
  String? secretKey;
  String? type;
  String? token;
  Wallet? wallet;
  bool? isActive;
  List<String>? orders;
  List<String>? smartTrades;
  List<String>? backtests;
  List<String>? alerts;

  User({
    this.email,
    this.password,
    this.gender,
    this.phoneNumber,
    this.type,
    this.orders,
    this.wallet,
    this.smartTrades,
    this.backtests,
    this.alerts,
    this.id,
    this.isActive,
    this.token,
    this.name,
    this.secretKey,
    this.username,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          isActive: json['isActive'],
          email: json['email'],
          name: json['name'],
          password: json['password'],
          username: json['username'],
          type: json['type'],
          wallet:
              json['wallet'] == null ? null : Wallet.fromJson(json['wallet']),
          secretKey: json['secretKey'],
          phoneNumber: json['phone_number'],
          token: json['token'],
          orders: (json['orders'] as List).map((e) => e as String).toList(),
          smartTrades:
              (json['smartTrades'] as List).map((e) => e as String).toList(),
          backtests:
              (json['backtests'] as List).map((e) => e as String).toList(),
          alerts: (json['alerts'] as List).map((e) => e as String).toList(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isActive': isActive,
        'name': name,
        'email': email,
        'gender': gender,
        'type': type,
        'password': password,
        'phone_number': phoneNumber,
        'secret_key': secretKey,
        'username': username,
        'orders': orders,
        'alerts': alerts,
        'backtests': backtests,
        'smartTrades': smartTrades,
      };
}
