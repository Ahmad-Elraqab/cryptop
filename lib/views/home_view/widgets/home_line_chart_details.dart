import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:flutter/material.dart';

class HomeLineChartDetails extends StatelessWidget {
  const HomeLineChartDetails({
    Key? key,
    this.ticker,
    this.chart,
  }) : super(key: key);

  final Ticker? ticker;
  final Chart? chart;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24.0,
      left: 24.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 15.0,
                child: Image.asset(
                  'lib/assets/coin.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: chart!.symbol,
                weight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 15.0,
                child: Image.asset(
                  'lib/assets/speedup.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: '${ticker!.priceChangePercent} %',
                weight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 15.0,
                child: Image.asset(
                  'lib/assets/interval.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: chart!.interval,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
