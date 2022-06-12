import 'package:cryptop/components/loading_animation/loading_animation.dart';
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
                    withdraw: withdraw,
                  ),
          );
        }),
      ),
    );
  }
}
