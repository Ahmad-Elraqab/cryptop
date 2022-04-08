import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class BacktestListItemBody extends StatelessWidget {
  const BacktestListItemBody({
    Key? key,
    this.activeIndex,
  }) : super(key: key);
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    final data = [
      {'input': 'trade', 'value': '500\$'},
      {'input': 'trade amount', 'value': '500\$'},
      {'input': 'trade count', 'value': '20'},
      {'input': 'buy on rsi', 'value': '30'},
      {'input': 'sell on rsi', 'value': '70'},
      {'input': 'interval', 'value': '1m'},
      {'input': 'profit', 'value': '30'},
      {'input': 'total trade count', 'value': '1250'},
      {'input': 'total profit', 'value': '252'},
      {'input': 'start date', 'value': '01-12-2020'},
      {'input': 'end date', 'value': '01-12-2020'},
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
