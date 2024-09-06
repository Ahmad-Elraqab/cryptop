import 'package:carousel_slider/carousel_slider.dart';
import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/line_chart/home_line_chart.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/home_view/widgets/home_line_chart_details.dart';
import 'package:cryptop/views/home_view/widgets/home_line_chart_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PairBoard extends StatelessWidget {
  const PairBoard({
    this.activeBoard,
    Key? key,
    this.data,
    this.setIndex,
    this.tickers,
  }) : super(key: key);

  final int? activeBoard;
  final Function? setIndex;
  final List<Chart>? data;
  final List<Ticker>? tickers;

  @override
  Widget build(BuildContext context) {
    final _ticker = tickers != null && data != null
        ? tickers!
            .where((element) => element.symbol == data![activeBoard!].symbol)
            .first
        : null;
    return Column(
      children: [
        Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(
                align: TextAlign.start,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: 'Market Update',
                weight: FontWeight.w600,
              ),
              InkWell(
                onTap: () => {},
                child: const TextComponent(
                  align: TextAlign.start,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.white,
                  title: 'See all',
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0,
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: tickers == null || data == null
              ? LoadingAnimation()
              : InkWell(
                  onTap: () => {
                    context.read(chartViewmodel).setCoin(_ticker!.symbol),
                    context.read(chartViewmodel).setInterval('4h'),
                    Navigator.pushNamed(context, rCoin),
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            onPageChanged: (index, value) => setIndex!(index),
                          ),
                          itemCount: data!.length,
                          itemBuilder: (context, y, index) {
                            return Stack(
                              children: [
                                HomeLineChart(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 100.0,
                                  data: data![activeBoard!]
                                      .candles!
                                      .map((e) => FlSpot(
                                          e.date.millisecondsSinceEpoch
                                              .toDouble(),
                                          e.close))
                                      .toList(),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: TextComponent(
                                      align: TextAlign.center,
                                      fontSize: 16.0,
                                      line: 1,
                                      textColor:
                                          _ticker!.priceChangePercent! < 0
                                              ? Color.fromARGB(255, 255, 97, 97)
                                              : const Color.fromARGB(
                                                  255, 40, 211, 163),
                                      title: _ticker.lastPrice.toString(),
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                HomeLineChartDetails(
                                  ticker: _ticker,
                                  chart: data![activeBoard!],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      HomeLineChartSlider(
                        activeBoard: activeBoard!,
                        length: data!.length,
                      )
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
