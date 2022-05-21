import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/components/coin_details/coin_detail.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/components/trade_action_button/trade_action_button.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/coin_view/widgets/favourite_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/ticker_model.dart';

class CoinBody extends StatefulWidget {
  const CoinBody({
    Key? key,
    this.setTradeType,
    this.title,
    this.chart,
    this.fcharts,
    this.tickers,
  }) : super(key: key);

  final Chart? chart;
  final List<Chart>? fcharts;
  final List<Ticker>? tickers;
  final String? title;
  final Function? setTradeType;

  @override
  State<CoinBody> createState() => _CoinBodyState();
}

final list = ['1m', '5m', '15m', '4h', '12h', '1d', '1M'];

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
        CoinDetail(tickers: widget.tickers, kline: widget.chart),
        const SizedBox(height: 20.0),
        TradeActionButton(
          setTradeType: widget.setTradeType,
        ),
        Container(
          height: 60.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            itemCount: list.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () =>
                  context.read(chartViewmodel).setInterval(list[index]),
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextComponent(
                      align: TextAlign.center,
                      fontSize: 14,
                      line: 1,
                      textColor: Colors.white,
                      title: list[index].toString(),
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: list[index] ==
                                  context.read(chartViewmodel).interval
                              ? Color.fromARGB(255, 245, 192, 0)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50.0)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 300.0,
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          child: widget.chart == null
              ? const LoadingAnimation()
              : Candlesticks(
                  candles: widget.chart!.candles!,
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
        FavouriteCoins(
          candles: widget.fcharts,
          tickers: widget.tickers,
        )
      ],
    );
  }
}
