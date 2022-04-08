import 'package:cryptop/views/wallet_view/widgets/wallet_detail.dart';
import 'package:flutter/material.dart';

import '../../../components/circular_chart/circular_chart.dart';
import '../../../components/title_header/title_header.dart';
import 'wallet_action_button.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({
    Key? key,
    this.deposit,
    this.withdraw,
    this.transfer,
  }) : super(key: key);
  final Function? deposit;
  final Function? withdraw;
  final Function? transfer;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
