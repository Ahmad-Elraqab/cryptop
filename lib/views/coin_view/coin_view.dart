import 'dart:convert';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/home_view/widgets/home_line_chart.dart';
import 'package:http/http.dart' as http;
import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/views/trade_view/widgets/coin_detail.dart';
import 'package:cryptop/views/trade_view/widgets/title_header.dart';
import 'package:cryptop/views/trade_view/widgets/trade_action_button.dart';
import 'package:flutter/material.dart';

class CoinView extends StatefulWidget {
  const CoinView({Key? key}) : super(key: key);

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
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
          child: Column(
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
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                height: 300.0,
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Candlesticks(
                  candles: candles,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextComponent(
                  align: TextAlign.start,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.white,
                  title: 'Favourite Charts',
                  weight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  children: [
                    for (int i = 0; i < 10; i++)
                      InkWell(
                        onTap: () => {},
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // Color.fromRGBO(231, 199, 187, 0.1),
                                  // Color.fromRGBO(249, 112, 104, 1),
                                  Color.fromRGBO(134, 255, 232, 0.1),
                                  Color.fromRGBO(18, 255, 209, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 12.0,
                                        line: 1,
                                        textColor: Colors.white,
                                        title: 'BTCUSDT',
                                        weight: FontWeight.bold,
                                      ),
                                      TextComponent(
                                        align: TextAlign.start,
                                        fontSize: 9.0,
                                        line: 1,
                                        textColor: Colors.white,
                                        title: '42,457.65\$',
                                        weight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  const TextComponent(
                                    align: TextAlign.start,
                                    fontSize: 9.0,
                                    line: 1,
                                    textColor: Colors.white,
                                    title: '3.75\$',
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: HomeLineChart(padding: 4.0),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
