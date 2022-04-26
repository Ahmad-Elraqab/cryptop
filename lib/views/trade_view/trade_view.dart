import 'package:cryptop/views/trade_view/widgets/trade_body.dart';
import 'package:flutter/material.dart';

class TradeView extends StatefulWidget {
  const TradeView({Key? key}) : super(key: key);

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int activeIndexList = 0;
  int tradeType = 0;
  double slider = 0;
  double limit = 0;
  double stop = 0;
  double price = 0;
  double pair = 0;
  double tether = 0;

  setIndexList(value) => setState(() => {
        activeIndexList = value,
        limit = 0,
        stop = 0,
        price = 0,
        pair = 0,
        tether = 0,
        slider = 0,
      });
  setSlider(value) => setState(() => {slider = double.parse(value.toString())});
  setTradeType(value) => setState(() => {tradeType = value});
  setItem(type, value) {
    setState(
      () {
        switch (type) {
          case 'limit':
            value == '+'
                ? limit += 1
                : limit == 0
                    ? 0
                    : limit -= 1;
            break;
          case 'stop':
            value == '+'
                ? stop += 1
                : stop == 0
                    ? 0
                    : stop -= 1;
            break;
          case 'price':
            value == '+'
                ? price += 1
                : price == 0
                    ? 0
                    : price -= 1;
            break;
          case 'pair':
            value == '+'
                ? pair += 1
                : pair == 0
                    ? 0
                    : pair -= 1;
            break;
          case 'tether':
            value == '+'
                ? tether += 1
                : tether == 0
                    ? 0
                    : tether -= 1;
            break;
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(55, 61, 76, 1),
        child: SingleChildScrollView(
          child: TradeBody(
            activeIndexList: activeIndexList,
            limit: limit,
            pair: pair,
            stop: stop,
            price: price,
            setIndexList: setIndexList,
            setItem: setItem,
            setSlider: setSlider,
            setTradeType: setTradeType,
            slider: slider,
            tether: tether,
            tradeType: tradeType,
          ),
        ),
      ),
    );
  }
}
