import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.reply,
              size: 26,
              color: Colors.amber,
            ),
          ),
          const SizedBox(width: 70.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.0,
                width: 10.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              const SizedBox(width: 15.0),
              const TextComponent(
                align: TextAlign.center,
                fontSize: 14,
                line: 1,
                textColor: Colors.white,
                title: 'BTCUSDT',
                weight: FontWeight.bold,
              ),
              const SizedBox(width: 15.0),
              Container(
                height: 10.0,
                width: 10.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}