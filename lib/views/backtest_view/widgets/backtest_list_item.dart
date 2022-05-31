import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/viewmodels/backtest_viewmodel/backtest_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
      {'input': 'profit', 'value': backtest!.profit!.toStringAsFixed(2)},
      {
        'input': 'start date',
        'value': DateFormat('MM-dd').format(backtest!.startDate!)
      },
      {
        'input': 'end date',
        'value': DateFormat('MM-dd').format(backtest!.endDate!)
      },
    ];
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.only(top: 8.0),
          shrinkWrap: true,
          childAspectRatio: 3.9,
          mainAxisSpacing: 15.0,
          children: [
            for (int i = 0; i < data.length; i++)
              Container(
                padding: EdgeInsets.only(left: 4.0),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                child: Column(
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
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomButtom(
                  borderColor: Colors.transparent,
                  borderRadius: 5.0,
                  buttonColor: Colors.amber,
                  buttonText: 'view',
                  buttonTextColor: Colors.white,
                  fontSize: 12,
                  hasImage: false,
                  height: 30.0,
                  width: 100,
                  horizontal: 20.0,
                  vertical: 4.0,
                  imageUrl: '',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      rBacktestResults,
                      arguments: {'backtest': backtest, 'selected': null},
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomButtom(
                  borderColor: Colors.transparent,
                  borderRadius: 5.0,
                  width: 100,
                  buttonColor: Colors.amber,
                  buttonText: 'Excel Details',
                  buttonTextColor: Colors.white,
                  fontSize: 12,
                  hasImage: false,
                  height: 30.0,
                  horizontal: 10.0,
                  vertical: 4.0,
                  imageUrl: '',
                  onTap: () =>
                      context.read(backtestViewmodel).createExcel(activeIndex),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
