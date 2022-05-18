import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
    this.index,
    this.onTap,
  }) : super(key: key);
  final int? index;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: InkWell(
        onTap: () => onTap!(index!),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: const BoxDecoration(
            // color: Colors.red,
            border: Border(
              bottom: BorderSide(color: Colors.white),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: exchange_pairs[index!],
                        weight: FontWeight.bold,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                  const TextComponent(
                    align: TextAlign.start,
                    fontSize: 9.0,
                    line: 1,
                    textColor: Colors.white,
                    title: 'Bitcoin/TetherUS',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/bitcoin.png'),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: 'Binance',
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const TextComponent(
                    align: TextAlign.end,
                    fontSize: 9.0,
                    line: 1,
                    textColor: Colors.white,
                    title: 'crypto',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
