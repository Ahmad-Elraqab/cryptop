import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class HomeLineChartDetails extends StatelessWidget {
  const HomeLineChartDetails({
    Key? key,
  }) : super(key: key);

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
              const TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: 'BTCUSDT',
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
              const TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: '5.48 %',
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
              const TextComponent(
                align: TextAlign.center,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.white,
                title: '1M',
                weight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
