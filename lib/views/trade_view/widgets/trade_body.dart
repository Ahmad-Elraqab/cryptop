import 'package:cryptop/components/coin_details/coin_detail.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/components/trade_action_button/trade_action_button.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/views/trade_view/widgets/trade_controller.dart';
import 'package:cryptop/views/trade_view/widgets/trade_type.dart';
import 'package:flutter/material.dart';

class TradeBody extends StatelessWidget {
  const TradeBody({
    Key? key,
    this.activeIndexList,
    this.tradeType,
    this.slider,
    this.setIndexList,
    this.setSlider,
    this.setTradeType,
    this.chart,
    this.tickers,
    this.onSubmit,
    this.controllers,
    this.symbol,
    this.updateField,
    this.loading,
  }) : super(key: key);
  final Chart? chart;
  final List<Ticker>? tickers;
  final int? activeIndexList;
  final int? tradeType;
  final double? slider;
  final String? symbol;
  final List<TextEditingController>? controllers;
  final bool? loading;
  final Function? onSubmit;
  final Function? updateField;
  final Function? setIndexList;
  final Function? setSlider;
  final Function? setTradeType;
  @override
  Widget build(BuildContext context) {
    final labels = ['Limit', 'Market', 'Stop Limit', 'OCO'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        TitleHeader(isTitle: true, title: chart == null ? '' : chart!.symbol),
        const SizedBox(
          height: 10.0,
        ),
        CoinDetail(kline: chart, tickers: tickers),
        const SizedBox(
          height: 20.0,
        ),
        TradeActionButton(
          setTradeType: setTradeType,
        ),
        TradeType(
          labels: labels,
          activeIndexList: activeIndexList,
          setIndexList: setIndexList,
        ),
        tickers == null && chart == null || loading == true
            ? LoadingAnimation()
            : TradeController(
                slider: slider,
                price: tickers!
                    .where((e) => e.symbol == chart!.symbol)
                    .first
                    .lastPrice,
                controllers: controllers,
                activeIndexList: activeIndexList,
                setSlider: setSlider,
                tradeType: tradeType,
                onSubmit: onSubmit,
                updateField: updateField,
              ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
