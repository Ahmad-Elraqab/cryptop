import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/line_chart/home_line_chart.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:flutter/material.dart';

class FavouriteCoins extends StatelessWidget {
  const FavouriteCoins({
    Key? key,
    this.candles,
  }) : super(key: key);
  final List<Chart>? candles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        children: [
          for (int i = 0; i < candles!.length; i++)
            InkWell(
              onTap: () => {},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: candles![i].rate! < 0
                            ? const [
                                Color.fromRGBO(231, 199, 187, 0.1),
                                Color.fromRGBO(249, 112, 104, 1),
                              ]
                            : const [
                                Color.fromRGBO(134, 255, 232, 0.1),
                                Color.fromRGBO(18, 255, 209, 1),
                              ]),
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
                              title: '${candles![i].lastPrice}\$',
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TextComponent(
                          align: TextAlign.start,
                          fontSize: 9.0,
                          line: 1,
                          textColor: Colors.white,
                          title: '${candles![i].rate}%',
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Expanded(
                      child: HomeLineChart(
                        padding: 4.0,
                        data: candles![i].candles,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
