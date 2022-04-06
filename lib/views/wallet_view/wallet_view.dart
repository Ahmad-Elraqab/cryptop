import 'package:cryptop/components/circular_chart/circular_chart.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/wallet_view/widgets/wallet_action_button.dart';
import 'package:flutter/material.dart';

import 'widgets/wallet_detail.dart';

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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(55, 61, 76, 1),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              const TitleHeader(isTitle: true, title: 'Wallet'),
              const CircularChart(),
              const SizedBox(height: 20.0),
              WalletActionButton(
                deposit: deposit,
                withdraw: withdraw,
                transfer: transfer,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const WalletDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
