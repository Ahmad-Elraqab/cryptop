import 'package:cryptop/models/backtest_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../text_component/text_component.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    Key? key,
    this.backtest,
  }) : super(key: key);

  final List<BacktestModel>? backtest;
  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'input': 'trade amount',
        'value': backtest!.map((e) => e.amount).toList()
      },
      {
        'input': 'trade count',
        'value': backtest!.map((e) => e.numberOfTrades).toList()
      },
      {'input': 'buy on', 'value': backtest!.map((e) => e.buyOn).toList()},
      {'input': 'sell on', 'value': backtest!.map((e) => e.sellOn).toList()},
      {'input': 'interval', 'value': backtest!.map((e) => e.interval).toList()},
      {
        'input': 'profit',
        'value': backtest!.map((e) => e.profit!.toStringAsFixed(2)).toList()
      },
      {
        'input': 'start date',
        'value': backtest!
            .map((e) => DateFormat('MM-dd').format(e.startDate!))
            .toList()
      },
      {
        'input': 'end date',
        'value': backtest!
            .map((e) => DateFormat('MM-dd').format(e.endDate!))
            .toList()
      },
    ];
    return Center(
      child: DataTable(
        horizontalMargin: 0,
        border: const TableBorder(
          horizontalInside: BorderSide(color: Colors.white, width: 2),
        ),
        columns: [
          DataColumn(label: Text('')),
          for (int i = 0; i < backtest!.length; i++)
            DataColumn(
              label: Center(
                child: TextComponent(
                  align: TextAlign.center,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.white,
                  title: backtest![i].interval,
                  weight: FontWeight.bold,
                ),
              ),
            ),
        ],
        rows: [
          for (int i = 0; i < data.length; i++)
            DataRow(
              cells: [
                DataCell(
                  TextComponent(
                    align: TextAlign.center,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: data[i]['input'].toString(),
                    weight: FontWeight.bold,
                  ),
                ),
                for (int j = 0; j < (data[i]['value'] as List).length; j++)
                  DataCell(
                    Center(
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: (data[i]['value'] as List)[j].toString(),
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
