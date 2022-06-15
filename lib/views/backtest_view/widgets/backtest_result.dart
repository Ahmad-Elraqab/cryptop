import 'package:cryptop/components/circular_chart/circular_chart.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_table/custom_table.dart';

class BacktestResult extends StatelessWidget {
  const BacktestResult({Key? key, this.data}) : super(key: key);

  final Object? data;
  @override
  Widget build(BuildContext context) {
    final backtest = (data as Map)['backtest'];

    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(55, 61, 76, 1),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              TitleHeader(
                isTitle: true,
                title:
                    backtest[0] is BacktestModel ? 'Backtest' : 'Smart Trade',
              ),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  ...(backtest)
                      .map(
                        (e) => Expanded(
                          child: Column(
                            children: [
                              CircularChart(
                                chartData: [
                                  ChartData(
                                    'winners',
                                    e.successfulOrders!.toDouble(),
                                  ),
                                  ChartData(
                                    'losers',
                                    e.failedOrders!.toDouble(),
                                  ),
                                  ChartData(
                                    'Trades',
                                    e.orderList.length!.toDouble(),
                                  ),
                                ],
                              ),
                              TextComponent(
                                align: TextAlign.start,
                                fontSize: 14.0,
                                line: 1,
                                textColor: Colors.white,
                                title: e.title,
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
              CustomTable(backtest: backtest.map((e) => e).toList()),
              backtest[0] is SmartTradeModel
                  ? Column(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: OrderList(
                            activeItem: null,
                            orderList: backtest[0].orderList,
                            setItem: (val) => {},
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
