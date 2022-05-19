import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/coin_view/widgets/coin_body.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinView extends StatefulWidget {
  const CoinView({Key? key, this.data}) : super(key: key);

  final Object? data;
  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  // ignore: avoid_print
  setTradeType(value) => setState(() => print(value));
  List<Candle> candles = [];
  @override
  void initState() {
    context
        .read(chartViewmodel)
        .fetchCandles(widget.data.toString(), '4h')
        .then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: CoinBody(
            candles: candles,
            setTradeType: setTradeType,
          ),
        ),
      ),
    );
  }
}
