import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../components/custom_buttom/custom_button.dart';

class MarketMovementList extends StatelessWidget {
  const MarketMovementList(
      {Key? key, this.activeIndexList, this.setIndexList, this.tickers})
      : super(key: key);

  final int? activeIndexList;
  final Function? setIndexList;
  final List<Ticker>? tickers;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemBuilder: (context, index) => InkWell(
          onTap: () => {
            context.read(chartViewmodel).setCoin(tickers![index].symbol),
            context.read(chartViewmodel).setInterval('4h'),
            Navigator.pushNamed(context, rCoin),
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextComponent(
                    align: TextAlign.start,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: tickers == null ? '' : tickers![index].symbol,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: TextComponent(
                    align: TextAlign.start,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: tickers == null
                        ? ''
                        : double.parse(tickers![index].lastPrice.toString())
                            .toStringAsFixed(4),
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 80.0,
                  child: CustomButtom(
                    fontSize: 14,
                    borderColor: Colors.transparent,
                    borderRadius: 5.0,
                    height: null,
                    horizontal: 8,
                    width: 100.0,
                    vertical: 3,
                    buttonColor: activeIndexList == 1
                        ? Color.fromARGB(255, 40, 211, 163)
                        : activeIndexList == 0
                            ? Color.fromARGB(255, 255, 97, 97)
                            : Colors.yellow[700],
                    buttonText: (tickers == null
                        ? ''
                        : NumberFormat.compact().format(
                              double.parse(
                                activeIndexList == 2
                                    ? tickers![index].volume.toString()
                                    : tickers![index]
                                        .priceChangePercent
                                        .toString(),
                              ),
                            ) +
                            (activeIndexList == 2 ? '' : ' %')),
                    buttonTextColor: Colors.white,
                    hasImage: false,
                    imageUrl: '',
                    onTap: () => {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
