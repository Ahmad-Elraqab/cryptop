import 'dart:convert';

import 'package:cryptop/app/router.dart';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/models/wallet_model.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_action.dart';
import 'package:cryptop/views/wallet_view/widgets/wallet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SystemWalletView extends StatefulWidget {
  const SystemWalletView({Key? key, required this.data}) : super(key: key);
  final Object data;

  @override
  State<SystemWalletView> createState() => _SystemWalletViewState();
}

class _SystemWalletViewState extends State<SystemWalletView> {
  onSell(s, q, id) async {
    final price = await http.get(Uri.parse(
        'https://api1.binance.com/api/v3/ticker/24hr?symbol=' + s + 'USDT'));

    final priceJson = double.parse(jsonDecode(price.body)['lastPrice']);

    final data = new Order(
      type: 'market',
      op: 'sell',
      pending: false,
      qAmount: q,
      amount: priceJson * q,
      status: 'succeed',
      symbol: s + 'USDT',
      price: priceJson,
    ).toJson();
    data['id'] = id;
    final order;
    if (RouteManager.role == 'admin') {
      order = await context.read(createOrderAdmin(data).future);
    } else {
      order = await context.read(createOrder(data).future);
    }

    if (order is Order) {
      ((widget.data as Map)['wallet'] as Wallet)
          .coins!
          .where((e) => e.symbol == s)
          .first
          .amount = 0.0;
      ((widget.data as Map)['wallet'] as Wallet)
          .coins!
          .where((e) => e.symbol == s)
          .first
          .profit = 0.0;
      ((widget.data as Map)['wallet'] as Wallet)
          .coins!
          .where((e) => e.symbol == s)
          .first
          .qAmount = 0.0;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(55, 61, 76, 1),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: WalletBody(
          wallet: (widget.data as Map)['wallet'],
          deposit: () => {},
          transfer: () => {},
          withdraw: () => {},
          onSell: onSell,
        ),
      ),
    ));
  }
}
