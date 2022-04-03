import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_incremental_button/custom_incremental_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/trade_view/widgets/trade_amount.dart';
import 'package:flutter/material.dart';

class TradeController extends StatelessWidget {
  const TradeController({
    Key? key,
    this.activeIndexList,
    this.slider,
    this.setSlider,
    this.tradeType,
    this.limit,
    this.stop,
    this.pair,
    this.price,
    this.tether,
    this.setItem,
  }) : super(key: key);

  final int? tradeType;
  final int? activeIndexList;
  final double? slider;
  final double? limit;
  final double? stop;
  final double? pair;
  final double? price;
  final double? tether;
  final Function? setSlider;
  final Function? setItem;

  Widget displayWidgets() {
    switch (activeIndexList) {
      case 0:
        return CustomIncrementalButton(
          title: price == 0 ? 'Price (USDT)' : price!.toString(),
          onClick: (value) => setItem!('price', value),
        );

      case 1:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 69, 69, 97),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const TextComponent(
            align: TextAlign.center,
            fontSize: 14,
            line: 1,
            title: 'Market Price',
            weight: FontWeight.bold,
            textColor: Colors.white,
          ),
        );

      case 2:
        return Column(
          children: [
            CustomIncrementalButton(
              title: stop == 0 ? 'Stop (USDT)' : stop!.toString(),
              onClick: (value) => setItem!('stop', value),
            ),
            CustomIncrementalButton(
              title: limit == 0 ? 'Limit (USDT)' : limit!.toString(),
              onClick: (value) => setItem!('limit', value),
            ),
          ],
        );

      case 3:
        return Column(
          children: [
            CustomIncrementalButton(
              title: price == 0 ? 'Price (USDT)' : price!.toString(),
              onClick: (value) => setItem!('price', value),
            ),
            CustomIncrementalButton(
              title: stop == 0 ? 'Stop (USDT)' : stop!.toString(),
              onClick: (value) => setItem!('stop', value),
            ),
            CustomIncrementalButton(
              title: limit == 0 ? 'Limit (USDT)' : limit!.toString(),
              onClick: (value) => setItem!('limit', value),
            ),
          ],
        );

      default:
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          displayWidgets(),
          TradeAmount(
            setSlider: setSlider,
            slider: slider,
          ),
          const SizedBox(height: 20.0),
          CustomButtom(
            borderColor: tradeType == 0
                ? const Color.fromARGB(188, 94, 242, 212)
                : const Color.fromARGB(255, 250, 131, 125),
            borderRadius: 20.0,
            buttonColor: tradeType == 0
                ? const Color.fromARGB(188, 94, 242, 212)
                : const Color.fromARGB(255, 250, 131, 125),
            buttonText: tradeType == 0 ? 'BUY' : 'SELL',
            buttonTextColor: Colors.white,
            fontSize: 14,
            hasImage: false,
            imageUrl: '',
            onTap: () => {},
            horizontal: 4.0,
            vertical: 10.0,
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
