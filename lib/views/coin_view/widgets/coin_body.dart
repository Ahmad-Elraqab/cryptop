import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/components/coin_details/coin_detail.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/components/trade_action_button/trade_action_button.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/views/coin_view/widgets/favourite_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinBody extends StatefulWidget {
  const CoinBody({
    Key? key,
    this.candles,
    this.setTradeType,
    this.title,
    this.kline,
    this.ticker,
    this.chartList,
  }) : super(key: key);

  final List<Chart>? chartList;
  final List<Candle>? candles;
  final String? title;
  final AsyncValue? kline;
  final AsyncValue? ticker;
  final Function? setTradeType;

  @override
  State<CoinBody> createState() => _CoinBodyState();
}

class _CoinBodyState extends State<CoinBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10.0),
        TitleHeader(
          isTitle: false,
          title: widget.title.toString(),
        ),
        const SizedBox(height: 10.0),
        CoinDetail(ticker: widget.ticker, kline: widget.kline),
        const SizedBox(height: 20.0),
        TradeActionButton(
          setTradeType: widget.setTradeType,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 300.0,
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          child: widget.candles == null
              ? const LoadingAnimation()
              : Candlesticks(
                  candles: widget.candles!,
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
        FavouriteCoins(candles: widget.chartList)
      ],
    );
  }
}
