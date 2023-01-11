import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/ticker_model.dart';

class CoinDetail extends StatelessWidget {
  const CoinDetail({
    Key? key,
    this.kline,
    this.tickers,
  }) : super(key: key);
  final Chart? kline;
  final List<Ticker>? tickers;
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
                FontAwesomeIcons.percent,
                color: Color.fromARGB(188, 94, 242, 212),
                size: 55.0,
              ),
              title: TextComponent(
                align: TextAlign.end,
                fontSize: 22,
                line: 1,
                textColor: const Color.fromARGB(255, 250, 131, 125),
                title: tickers == null || kline == null
                    ? ''
                    : tickers!
                        .where((e) => e.symbol == kline!.symbol)
                        .first
                        .lastPrice!
                        .toStringAsFixed(2),
                weight: FontWeight.bold,
              ),
              subtitle: TextComponent(
                align: TextAlign.end,
                fontSize: 16,
                line: 1,
                textColor: const Color.fromARGB(188, 94, 242, 212),
                title: tickers == null || kline == null
                    ? ''
                    : tickers!
                        .where((e) => e.symbol == kline!.symbol)
                        .first
                        .priceChangePercent
                        .toString(),
                weight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kline == null
                    ? _row('......', '......')
                    : _row(
                        ('High : ' +
                            kline!.candles![0].high.toStringAsFixed(2)),
                        ('Low : ' + kline!.candles![0].low.toStringAsFixed(2))),
                kline == null
                    ? _row('......', '......')
                    : _row(
                        ('Close : ' +
                            kline!.candles![0].close.toStringAsFixed(2)),
                        ('Open : ' +
                            kline!.candles![0].open.toStringAsFixed(2))),
                kline == null
                    ? _row('......', '......')
                    : _row(
                        ('V : ' + kline!.candles![0].volume.toStringAsFixed(2)),
                        ('Q : ' +
                            kline!.candles![0].volume.toStringAsFixed(2))),
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
