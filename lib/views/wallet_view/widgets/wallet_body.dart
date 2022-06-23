import 'package:cryptop/app/router.dart';
import 'package:cryptop/models/wallet_model.dart';
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
    this.wallet,
    this.onSell,
  }) : super(key: key);
  final Function? deposit;
  final Wallet? wallet;
  final Function? onSell;
  final Function? withdraw;
  final Function? transfer;
  @override
  Widget build(BuildContext context) {
    final chartData = wallet!.coins!.where((element) => element.amount! > 0.0);

    return Column(
      children: [
        const TitleHeader(isTitle: true, title: 'Wallet'),
        CircularChart(
          chartData: chartData
              .map(
                (e) => ChartData(
                    e.symbol!, double.parse(e.amount!.toStringAsFixed(2))),
              )
              .toList(),
        ),
        const SizedBox(height: 20.0),
        RouteManager.role == 'admin'
            ? SizedBox()
            : WalletActionButton(
                deposit: deposit,
                withdraw: withdraw,
                transfer: transfer,
              ),
        const SizedBox(
          height: 30.0,
        ),
        WalletDetail(wallet: wallet, onSell: onSell),
      ],
    );
  }
}
