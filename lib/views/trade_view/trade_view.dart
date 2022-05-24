import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/viewmodels/ticker_viewmodel/ticker_action.dart';
import 'package:cryptop/viewmodels/trade_viewmodel/trade_action.dart';
import 'package:cryptop/views/trade_view/widgets/trade_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TradeView extends StatefulWidget {
  const TradeView({Key? key, this.data = 'BTCUSDT'}) : super(key: key);

  final String? data;
  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int activeIndexList = 0;
  int tradeType = 0;
  double slider = 0;

  setIndexList(value) => setState(() => {activeIndexList = value, slider = 0});
  setSlider(value) => setState(() => {slider = double.parse(value.toString())});
  setTradeType(value) => setState(() => {tradeType = value});

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, child) {
        watch(klineProvider)
            .whenData((value) => watch(chartViewmodel).updateCandle(value));
        watch(messageProvider)
            .whenData((value) => watch(tickerViewmodel).updateTickers(value));

        final chart = watch(chartViewmodel).liveChart;
        final tickers = watch(tickerViewmodel).tickers;
        final controllers = watch(tradeViewmodel).controllers;

        return Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: SingleChildScrollView(
            child: TradeBody(
              activeIndexList: activeIndexList,
              chart: chart,
              symbol: widget.data,
              tickers: tickers,
              slider: slider,
              tradeType: tradeType,
              controllers: controllers,
              setIndexList: setIndexList,
              setSlider: setSlider,
              setTradeType: setTradeType,
              onSubmit: onSubmit,
            ),
          ),
        );
      }),
    );
  }
}
