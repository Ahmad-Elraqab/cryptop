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
    this.controllers,
    this.onSubmit,
    this.price,
    this.updateField,
  }) : super(key: key);

  final int? tradeType;
  final int? activeIndexList;
  final double? slider;
  final double? price;
  final List<TextEditingController>? controllers;
  final Function? onSubmit;
  final Function? setSlider;
  final Function? updateField;

  Widget displayWidgets() {
    switch (activeIndexList) {
      case 0:
        return CustomIncrementalButton(
          title: 'Price (USDT)',
          controller: controllers![0],
          type: 0,
          onChange: updateField,
          price: price,
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
              title: 'Stop (USDT)',
              price: price,
              type: 1,
              onChange: updateField,
              controller: controllers![1],
            ),
            CustomIncrementalButton(
              title: 'Limit (USDT)',
              price: price,
              type: 0,
              onChange: updateField,
              controller: controllers![0],
            ),
          ],
        );

      case 3:
        return Column(
          children: [
            CustomIncrementalButton(
              title: 'Price (USDT)',
              controller: controllers![0],
              onChange: updateField,
              price: price,
              type: 0,
            ),
            CustomIncrementalButton(
              title: 'Stop (USDT)',
              onChange: updateField,
              controller: controllers![1],
              price: price,
              type: 1,
            ),
            CustomIncrementalButton(
              title: 'Limit (USDT)',
              price: price,
              type: 2,
              onChange: updateField,
              controller: controllers![2],
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
            price: price,
            slider: slider,
            controllers: controllers,
            updateField: updateField,
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
            onTap: () => onSubmit!(),
            horizontal: 4.0,
            vertical: 10.0,
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
