import 'dart:convert';
import 'package:cryptop/views/coin_view/widgets/coin_body.dart';
import 'package:http/http.dart' as http;
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class CoinView extends StatefulWidget {
  const CoinView({Key? key}) : super(key: key);

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  // ignore: avoid_print
  setTradeType(value) => setState(() => print(value));
  List<Candle> candles = [];
  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF24242B),
          child: CoinBody(
            candles: candles,
            setTradeType: setTradeType,
          ),
        ),
      ),
    );
  }
}
