import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/components/coin_details/coin_detail.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/components/trade_action_button/trade_action_button.dart';
import 'package:cryptop/views/coin_view/widgets/favourite_coin.dart';
import 'package:flutter/material.dart';

class CoinBody extends StatelessWidget {
  const CoinBody({Key? key, this.candles, this.setTradeType}) : super(key: key);

  final List<Candle>? candles;
  final Function? setTradeType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10.0),
        const TitleHeader(
          isTitle: false,
          title: 'BTCUSDT',
        ),
        const SizedBox(height: 10.0),
        const CoinDetail(),
        const SizedBox(height: 20.0),
        TradeActionButton(
          setTradeType: setTradeType,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 300.0,
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Candlesticks(
            candles: candles!,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextComponent(
            align: TextAlign.start,
            fontSize: 14.0,
            line: 1,
            textColor: Colors.white,
            title: 'Favourite Charts',
            weight: FontWeight.bold,
          ),
        ),
        const FavouriteCoins()
      ],
    );
  }
}
