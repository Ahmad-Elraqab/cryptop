import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/viewmodels/ticker_viewmodel/ticker_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../components/custom_buttom/custom_button.dart';

class MarketMovementList extends StatefulWidget {
  const MarketMovementList({Key? key, this.activeIndexList, this.setIndexList})
      : super(key: key);

  final int? activeIndexList;
  final Function? setIndexList;
  @override
  State<MarketMovementList> createState() => _MarketMovementListState();
}

class _MarketMovementListState extends State<MarketMovementList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final tickers =
          watch(tickerViewmodel).getSortedTicker(widget.activeIndexList);
      return Expanded(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 5),
          itemBuilder: (context, index) => Padding(
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
                    title: tickers == null ? '' : tickers[index].symbol,
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
                        : double.parse(tickers[index].lastPrice.toString())
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
                    buttonColor: widget.activeIndexList == 1
                        ? Color.fromARGB(255, 40, 211, 163)
                        : widget.activeIndexList == 0
                            ? Color.fromARGB(255, 255, 97, 97)
                            : Colors.yellow[700],
                    buttonText: (tickers == null
                        ? ''
                        : NumberFormat.compact().format(
                              double.parse(
                                widget.activeIndexList == 2
                                    ? tickers[index].volume.toString()
                                    : tickers[index]
                                        .priceChangePercent
                                        .toString(),
                              ),
                            ) +
                            (widget.activeIndexList == 2 ? '' : ' %')),
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
      );
    });
  }
}
