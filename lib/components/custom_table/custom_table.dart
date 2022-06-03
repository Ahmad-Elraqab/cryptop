import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../text_component/text_component.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    Key? key,
    this.backtest,
  }) : super(key: key);

  final List<dynamic>? backtest;
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
      {
        'input': 'stop lose',
        'value': backtest!.map((e) => e.stopLose).toList()
      },
      {
        'input': 'success',
        'value': backtest!.map((e) => e.successfulOrders).toList()
      },
      {'input': 'fail', 'value': backtest!.map((e) => e.failedOrders).toList()},
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DataTable(
          border: TableBorder.all(
            color: Colors.white,
            width: 2,
            borderRadius: BorderRadius.circular(5.0),
          ),
          columnSpacing: backtest!.length == 1 ? 120 : 30,
          columns: [
            DataColumn(label: Text('')),
            for (int i = 0; i < backtest!.length; i++)
              DataColumn(
                label: SizedBox(
                  width: 100,
                  child: TextComponent(
                    align: TextAlign.center,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: backtest![i].title,
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
                    InkWell(
                      onTap: () => print('object'),
                      child: SizedBox(
                        width: 100,
                        child: TextComponent(
                          align: TextAlign.start,
                          fontSize: 14.0,
                          line: 1,
                          textColor: Colors.white,
                          title: data[i]['input'].toString(),
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  for (int j = 0; j < (data[i]['value'] as List).length; j++)
                    DataCell(
                      SizedBox(
                        width: 100,
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
      ),
    );
  }
}
