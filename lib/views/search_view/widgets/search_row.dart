import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
    this.index,
    this.onTap,
    this.data,
    this.ticker,
  }) : super(key: key);
  final List? data;
  final int? index;
  final Function? onTap;
  final Ticker? ticker;
  @override
  Widget build(BuildContext context) {
    final color =
        ticker!.priceChangePercent! < 0 ? Colors.red[300] : Colors.green[300];
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, rCoin, arguments: data![index!]),
      child: Container(
        height: 70.0,
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: const BoxDecoration(
            // color: Colors.red,
            border: Border(
              bottom: BorderSide(color: Colors.white),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: data![index!],
                        weight: FontWeight.bold,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                  const TextComponent(
                    align: TextAlign.start,
                    fontSize: 9.0,
                    line: 1,
                    textColor: Colors.white,
                    title: 'Bitcoin/TetherUS',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: ticker!.priceChangePercent! == 0
                            ? Colors.white
                            : color,
                        title: ticker!.lastPrice!.toString(),
                        weight: FontWeight.bold,
                      ),
                      TextComponent(
                        align: TextAlign.start,
                        fontSize: 9.0,
                        line: 1,
                        textColor: Colors.white,
                        title: ticker!.volume!.toStringAsFixed(2) + ' vol',
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 60.0,
                    child: CustomButtom(
                      fontSize: 14,
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      height: null,
                      horizontal: 8,
                      width: 100.0,
                      vertical: 5,
                      buttonTextColor: Colors.white,
                      hasImage: false,
                      buttonColor: color,
                      buttonText:
                          ticker!.priceChangePercent!.toStringAsFixed(1) + '%',
                      imageUrl: '',
                      onTap: () => {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
