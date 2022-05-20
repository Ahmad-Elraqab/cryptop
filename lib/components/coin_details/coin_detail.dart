import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinDetail extends StatelessWidget {
  const CoinDetail({
    Key? key,
    this.kline,
    this.ticker,
  }) : super(key: key);
  final AsyncValue? kline;
  final AsyncValue? ticker;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              horizontalTitleGap: 0.0,
              trailing: const Icon(
                Icons.percent_outlined,
                color: Color.fromARGB(188, 94, 242, 212),
                size: 55.0,
              ),
              title: TextComponent(
                align: TextAlign.end,
                fontSize: 22,
                line: 1,
                textColor: const Color.fromARGB(255, 250, 131, 125),
                title: ticker!.data == null
                    ? ''
                    : double.parse(ticker!.data!.value['data']['c'])
                        .toStringAsFixed(2),
                weight: FontWeight.bold,
              ),
              subtitle: TextComponent(
                align: TextAlign.end,
                fontSize: 16,
                line: 1,
                textColor: const Color.fromARGB(188, 94, 242, 212),
                title: ticker!.data == null
                    ? ''
                    : ticker!.data!.value['data']['P'].toString(),
                weight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kline!.data == null
                    ? _row('......', '......')
                    : _row(
                        ('High : ' +
                            double.parse(kline!.data!.value['data']['k']['h'])
                                .toStringAsFixed(2)),
                        ('Low : ' +
                            double.parse(kline!.data!.value['data']['k']['l'])
                                .toStringAsFixed(2))),
                kline!.data == null
                    ? _row('......', '......')
                    : _row(
                        ('Close : ' +
                            double.parse(kline!.data!.value['data']['k']['c'])
                                .toStringAsFixed(2)),
                        ('Open : ' +
                            double.parse(kline!.data!.value['data']['k']['o'])
                                .toStringAsFixed(2))),
                kline!.data == null
                    ? _row('......', '......')
                    : _row(
                        ('V : ' +
                            double.parse(kline!.data!.value['data']['k']['v'])
                                .toStringAsFixed(2)),
                        ('Q : ' +
                            double.parse(kline!.data!.value['data']['k']['q'])
                                .toStringAsFixed(2))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _row(item1, item2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 6,
          child: TextComponent(
            align: TextAlign.center,
            fontSize: 10,
            line: 1,
            textColor: Colors.white,
            title: item1,
            weight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 7,
            ),
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: TextComponent(
            align: TextAlign.center,
            fontSize: 10,
            line: 1,
            textColor: Colors.white,
            title: item2,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
