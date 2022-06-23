import 'dart:convert';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_action.dart';
import 'package:cryptop/viewmodels/ticker_viewmodel/ticker_action.dart';
import 'package:cryptop/viewmodels/wallet_viewmodel/wallet_action.dart';
import 'package:cryptop/views/wallet_view/widgets/wallet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  deposit() => {};
  withdraw() => {};
  transfer() => {};
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

    order = await context.read(createOrder(data).future);

    if (order is Order) {
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
        child: Consumer(builder: (context, watch, child) {
          final wallet = watch(getWallet).data?.value;
          watch(messageProvider).whenData(
            (value) => {
              watch(walletViewmodel)
                  .updateWallet(value['data']['s'], value['data']['c']),
            },
          );

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(55, 61, 76, 1),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: wallet == null
                ? LoadingAnimation()
                : WalletBody(
                    wallet: wallet,
                    deposit: deposit,
                    transfer: transfer,
                    onSell: onSell,
                    withdraw: withdraw,
                  ),
          );
        }),
      ),
    );
  }
}
