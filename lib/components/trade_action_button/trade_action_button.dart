import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/clipper/clipper.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class TradeActionButton extends StatelessWidget {
  const TradeActionButton({
    Key? key,
    this.title,
    this.setTradeType,
  }) : super(key: key);

  final String? title;
  final Function? setTradeType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipperBuy(),
            child: Container(
              color: const Color.fromARGB(188, 94, 242, 212),
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 2,
              ),
              child: Center(
                child: InkWell(
                  onTap: () => setTradeType!(0),
                  child: const TextComponent(
                    align: TextAlign.center,
                    fontSize: 16,
                    line: 1,
                    textColor: Colors.white,
                    title: 'BUY',
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: MyClipperSell(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 250, 131, 125),
              height: 50,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 2,
              ),
              child: Center(
                child: InkWell(
                  onTap: () => setTradeType!(1),
                  child: const TextComponent(
                    align: TextAlign.center,
                    fontSize: 16,
                    line: 1,
                    textColor: Colors.white,
                    title: 'SELL',
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
