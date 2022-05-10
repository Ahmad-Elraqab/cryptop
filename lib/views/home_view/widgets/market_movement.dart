import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class MarketMovment extends StatelessWidget {
  const MarketMovment({
    Key? key,
    required this.activeIndexList,
    required this.setIndexList,
    this.ticker_24,
  }) : super(key: key);

  final int? activeIndexList;
  final List? ticker_24;
  final Function? setIndexList;

  @override
  Widget build(BuildContext context) {
    final labels = ['Losers', 'Gainers', '24 Vol'];
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(55, 61, 76, 1),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (var i = 0; i < labels.length; i++)
                  CustomButtom(
                    fontSize: 14,
                    borderColor: Colors.transparent,
                    borderRadius: 7.0,
                    height: null,
                    horizontal: 8,
                    width: 70.0,
                    vertical: 3,
                    buttonColor: i == activeIndexList
                        ? Colors.amber
                        : Colors.transparent,
                    buttonText: labels[i],
                    buttonTextColor: Colors.white,
                    hasImage: false,
                    imageUrl: '',
                    onTap: () => {setIndexList!(i)},
                  ),
              ],
            ),
            Expanded(
              child: ticker_24 == null
                  ? const SizedBox(
                      height: 200.0,
                      child: RiveAnimation.asset('lib/assets/loading.riv'),
                    )
                  : ListView.builder(
                      itemCount: ticker_24![activeIndexList!].length,
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
                                title: ticker_24![activeIndexList!][index]
                                    ['symbol'],
                                weight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: TextComponent(
                                align: TextAlign.start,
                                fontSize: 14.0,
                                line: 1,
                                textColor: Colors.white,
                                title: double.parse(ticker_24![activeIndexList!]
                                        [index]['lastPrice'])
                                    .toStringAsFixed(4),
                                weight: FontWeight.bold,
                              ),
                            ),
                            Container(
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
                                    ? Colors.green[300]
                                    : activeIndexList == 0
                                        ? Colors.red[300]
                                        : Colors.yellow[700],
                                buttonText: (NumberFormat.compact().format(
                                      double.parse(ticker_24![activeIndexList!]
                                              [index][
                                          activeIndexList == 2
                                              ? 'volume'
                                              : 'priceChangePercent']),
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
          ],
        ),
      ),
    );
  }
}
