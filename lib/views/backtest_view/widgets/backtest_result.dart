import 'package:cryptop/components/circular_chart/circular_chart.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../components/custom_table/custom_table.dart';

class BacktestResult extends StatelessWidget {
  const BacktestResult({Key? key, this.data}) : super(key: key);

  final Object? data;
  @override
  Widget build(BuildContext context) {
    final backtest = (data as Map)['backtest'];
    final selected = (data as Map)['selected'];

    print(this.data);
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(55, 61, 76, 1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              TitleHeader(
                  isTitle: true,
                  title: backtest[0] is BacktestModel
                      ? 'Backtest'
                      : 'Smart Trade'),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  ...(selected as List<int>)
                      .map(
                        (e) => Expanded(
                          child: Column(
                            children: [
                              CircularChart(
                                chartData: [
                                  ChartData(
                                    'winners',
                                    (backtest[e]).successfulOrders!.toDouble(),
                                  ),
                                  ChartData(
                                    'losers',
                                    (backtest[e]).failedOrders!.toDouble(),
                                  ),
                                  ChartData(
                                    'Trades',
                                    backtest[e].orderList.length!.toDouble(),
                                  ),
                                ],
                              ),
                              TextComponent(
                                align: TextAlign.start,
                                fontSize: 14.0,
                                line: 1,
                                textColor: Colors.white,
                                title: backtest[e].title,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
              const SizedBox(height: 30.0),
              CustomTable(
                backtest: selected == null
                    ? [backtest]
                    : (selected).map((e) => backtest[e]).toList(),
              ),
              backtest[0] is SmartTradeModel
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 40.0, bottom: 10),
                            child: TextComponent(
                                align: TextAlign.start,
                                fontSize: 12,
                                weight: FontWeight.bold,
                                line: 1,
                                textColor: Colors.white,
                                title: 'Orders List'),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: backtest[0].orderList.length,
                            itemBuilder: (context, index) => Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
                                ),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 12,
                                        weight: FontWeight.bold,
                                        line: 1,
                                        textColor: Colors.white,
                                        title: backtest[0]
                                            .orderList[index]
                                            .symbol
                                            .toString(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 12,
                                        line: 1,
                                        textColor: Colors.white,
                                        weight: FontWeight.bold,
                                        title: DateFormat('MM-dd').format(
                                            backtest[0]
                                                .orderList[index]
                                                .openDate),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 12,
                                        line: 1,
                                        textColor: Colors.white,
                                        weight: FontWeight.bold,
                                        title: DateFormat('MM-dd').format(
                                            backtest[0]
                                                .orderList[index]
                                                .closeDate),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 12,
                                        line: 1,
                                        weight: FontWeight.bold,
                                        textColor: Colors.white,
                                        title: backtest[0]
                                            .orderList[index]
                                            .rate
                                            .toStringAsFixed(2),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomButtom(
                                        height: 30,
                                        borderColor: Colors.transparent,
                                        borderRadius: 5,
                                        buttonColor: Colors.amber[600],
                                        buttonText: 'Sell',
                                        buttonTextColor: Colors.white,
                                        fontSize: 12,
                                        hasImage: false,
                                        imageUrl: '',
                                        onTap: () {},
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
