import 'package:cryptop/components/coin_details/coin_detail.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/components/trade_action_button/trade_action_button.dart';
import 'package:cryptop/views/trade_view/widgets/trade_controller.dart';
import 'package:cryptop/views/trade_view/widgets/trade_type.dart';
import 'package:flutter/material.dart';

class TradeBody extends StatelessWidget {
  const TradeBody(
      {Key? key,
      this.activeIndexList,
      this.tradeType,
      this.slider,
      this.limit,
      this.stop,
      this.price,
      this.pair,
      this.tether,
      this.setIndexList,
      this.setSlider,
      this.setTradeType,
      this.setItem})
      : super(key: key);
  final int? activeIndexList;
  final int? tradeType;
  final double? slider;
  final double? limit;
  final double? stop;
  final double? price;
  final double? pair;
  final double? tether;
  final Function? setIndexList;
  final Function? setSlider;
  final Function? setTradeType;
  final Function? setItem;
  @override
  Widget build(BuildContext context) {
    final labels = ['Limit', 'Market', 'Stop Limit', 'OCO'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        const TitleHeader(),
        const Divider(
          color: Colors.white,
          height: 20,
          thickness: 2,
        ),
        const SizedBox(
          height: 10.0,
        ),
        const CoinDetail(),
        const SizedBox(
          height: 20.0,
        ),
        TradeActionButton(
          setTradeType: setTradeType,
        ),
        TradeType(
          labels: labels,
          activeIndexList: activeIndexList,
          setIndexList: setIndexList,
        ),
        TradeController(
          slider: slider,
          activeIndexList: activeIndexList,
          setSlider: setSlider,
          tradeType: tradeType,
          limit: limit,
          stop: stop,
          pair: pair,
          price: price,
          tether: tether,
          setItem: setItem,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
