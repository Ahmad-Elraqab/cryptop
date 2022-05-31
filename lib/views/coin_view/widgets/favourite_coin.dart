import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/line_chart/home_line_chart.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteCoins extends StatelessWidget {
  const FavouriteCoins({
    Key? key,
    this.candles,
    this.tickers,
  }) : super(key: key);
  final List<Chart>? candles;
  final List<Ticker>? tickers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: candles == null || tickers == null
          ? LoadingAnimation()
          : GridView.count(
              crossAxisCount: 3,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              children: [
                for (int i = 0; i < candles!.length; i++)
                  InkWell(
                    onTap: () => {
                      context.read(chartViewmodel).setCoin(candles![i].symbol),
                      context.read(chartViewmodel).setInterval('4h'),
                      Navigator.popAndPushNamed(context, rCoin)
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                              colors: tickers != null
                                  ? tickers!
                                              .where((e) =>
                                                  e.symbol ==
                                                  candles![i].symbol)
                                              .first
                                              .priceChangePercent! <
                                          0
                                      ? const [
                                          Color.fromRGBO(231, 199, 187, 0.1),
                                          Color.fromRGBO(249, 112, 104, 1),
                                        ]
                                      : const [
                                          Color.fromRGBO(134, 255, 232, 0.1),
                                          Color.fromRGBO(18, 255, 209, 1),
                                        ]
                                  : []),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextComponent(
                                    align: TextAlign.start,
                                    fontSize: 12.0,
                                    line: 1,
                                    textColor: Colors.white,
                                    title: candles![i].symbol!,
                                    weight: FontWeight.bold,
                                  ),
                                  TextComponent(
                                    align: TextAlign.start,
                                    fontSize: 9.0,
                                    line: 1,
                                    textColor: Colors.white,
                                    title:
                                        '${tickers!.where((e) => e.symbol == candles![i].symbol).first.lastPrice!.toStringAsFixed(2)}\$',
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              TextComponent(
                                align: TextAlign.start,
                                fontSize: 9.0,
                                line: 1,
                                textColor: Colors.white,
                                title:
                                    '${tickers!.where((e) => e.symbol == candles![i].symbol).first.priceChangePercent!.toStringAsFixed(2)}%',
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Expanded(
                            child: HomeLineChart(
                                padding: 0.0,
                                data: candles![i]
                                    .candles!
                                    .map((e) => FlSpot(
                                        e.date.millisecondsSinceEpoch
                                            .toDouble(),
                                        e.close))
                                    .toList()),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
