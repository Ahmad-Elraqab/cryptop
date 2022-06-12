import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/wallet_model.dart';
import 'package:flutter/material.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({
    Key? key,
    this.wallet,
  }) : super(key: key);
  final Wallet? wallet;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                height: 10.0,
                width: 10.0,
              ),
              const SizedBox(width: 10.0),
              const TextComponent(
                align: TextAlign.start,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: 'Wallet Details',
                weight: FontWeight.bold,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: wallet?.coins?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextComponent(
                        align: TextAlign.start,
                        fontSize: 12.0,
                        line: 1,
                        textColor: Colors.white,
                        title: (wallet?.coins?[index] as Coin).symbol,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 12.0,
                        line: 2,
                        textColor: Colors.white,
                        title: (wallet?.coins?[index] as Coin)
                            .qAmount!
                            .toStringAsFixed(4),
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 12.0,
                        line: 1,
                        textColor: Colors.white,
                        title: (wallet?.coins?[index] as Coin)
                                .amount!
                                .toStringAsFixed(2) +
                            '\$',
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 12.0,
                        line: 1,
                        textColor: Colors.white,
                        title: (wallet?.coins?[index] as Coin)
                                .currentPrice!
                                .toStringAsFixed(2) +
                            '\$',
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 12.0,
                        line: 1,
                        textColor: Colors.white,
                        title: (wallet?.coins?[index] as Coin).profit!.isFinite
                            ? (wallet?.coins?[index] as Coin)
                                    .profit!
                                    .toStringAsFixed(2) +
                                '%'
                            : '',
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
