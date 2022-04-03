import 'package:cryptop/components/custom_incremental_button/custom_incremental_button.dart';
import 'package:flutter/material.dart';
import '../../../components/text_component/text_component.dart';

class TradeAmount extends StatelessWidget {
  const TradeAmount({
    Key? key,
    required this.setSlider,
    required this.slider,
  }) : super(key: key);

  final Function? setSlider;
  final double? slider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIncrementalButton(title: 'Price (USDT)', onClick: () => {}),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                InkWell(
                  onTap: () => setSlider!((i + 1) * 25),
                  child: Column(
                    children: [
                      TextComponent(
                        align: TextAlign.center,
                        fontSize: 14,
                        title: ((i + 1) * 25).toString() + '%',
                        line: 1,
                        textColor: slider == ((i + 1) * 25)
                            ? Colors.amber
                            : Colors.white,
                        weight: FontWeight.bold,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: slider == ((i + 1) * 25)
                              ? Colors.amber
                              : Colors.white,
                        ),
                        width: 75,
                        height: 5,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Slider(
          value: slider!,
          max: 100,
          min: 0,
          onChanged: (value) => {setSlider!(value)},
          activeColor: Colors.amber,
          inactiveColor: Colors.white,
        ),
        const SizedBox(
          height: 10.0,
        ),
        CustomIncrementalButton(title: 'Price (USDT)', onClick: () => {}),
      ],
    );
  }
}
