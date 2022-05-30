import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:flutter/material.dart';

class BacktestListItemBody extends StatelessWidget {
  const BacktestListItemBody({
    Key? key,
    this.activeIndex,
    this.backtest,
  }) : super(key: key);
  final int? activeIndex;
  final BacktestModel? backtest;
  @override
  Widget build(BuildContext context) {
    final data = [
      {'input': 'trade amount', 'value': (backtest!.amount.toString() + '\$')},
      {'input': 'trade count', 'value': backtest!.numberOfTrades.toString()},
      {'input': 'buy on', 'value': backtest!.buyOn.toString()},
      {'input': 'sell on', 'value': backtest!.sellOn.toString()},
      {'input': 'interval', 'value': backtest!.interval.toString()},
      {'input': 'profit', 'value': backtest!.profit.toString()},
      {'input': 'start date', 'value': backtest!.startDate.toString()},
      {'input': 'end date', 'value': backtest!.endDate.toString()},
    ];
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 3,
            mainAxisSpacing: 20.0,
            children: [
              for (int i = 0; i < data.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      align: TextAlign.start,
                      fontSize: 9.0,
                      line: 1,
                      textColor: Colors.white,
                      title: data[i]['input'].toString(),
                      weight: FontWeight.bold,
                    ),
                    TextComponent(
                      align: TextAlign.start,
                      fontSize: 12.0,
                      line: 1,
                      textColor: Colors.white,
                      title: data[i]['value'].toString(),
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
