import 'package:cryptop/components/line_chart/home_line_chart.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_table/custom_table.dart';

class BacktestResult extends StatelessWidget {
  const BacktestResult({Key? key, this.data}) : super(key: key);

  final Object? data;
  @override
  Widget build(BuildContext context) {
    final backtest = (data as Map)['backtest'];
    final selected = (data as Map)['selected'];
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(55, 61, 76, 1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const TitleHeader(isTitle: true, title: 'Backtest'),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    for (int i = 0; i < backtest.length; i++)
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.purple,
                              ),
                              margin: const EdgeInsets.only(right: 4.0),
                            ),
                            const TextComponent(
                              align: TextAlign.start,
                              fontSize: 14.0,
                              line: 1,
                              textColor: Colors.white,
                              title: 'RSI-1',
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              HomeLineChart(
                height: 150,
                padding: 30.0,
                color: Color(0xFF24242B),
                data: [
                  FlSpot(1, 15),
                  FlSpot(2, 5),
                  FlSpot(3, 7),
                ],
              ),
              const SizedBox(height: 30.0),
              CustomTable(
                backtest: [
                  backtest[selected[0]],
                  backtest[selected[1]],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
