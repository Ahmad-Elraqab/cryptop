import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_list_item.dart';
import 'package:flutter/material.dart';

class BacktestList extends StatelessWidget {
  const BacktestList({
    Key? key,
    this.setIndex,
    this.activeIndex,
    this.selected,
    this.setItem,
  }) : super(key: key);

  final List<int>? selected;
  final Function? setItem;
  final Function? setIndex;
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () => setIndex!(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: 'RSI',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: '20',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: '500\$',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: '9.56%',
                      weight: FontWeight.bold,
                    ),
                    Transform.scale(
                      scale: 1.35,
                      child: Theme(
                        child: Checkbox(
                          splashRadius: 0,
                          activeColor: Colors.white,
                          hoverColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: Colors.black,
                          onChanged: (value) => setItem!(index),
                          value: selected?.contains(index),
                        ),
                        data: ThemeData(
                          primarySwatch: Colors.blue,
                          unselectedWidgetColor: Colors.red, // Your color
                        ),
                      ),
                    ),
                  ],
                ),
                activeIndex == index
                    ? BacktestListItemBody(activeIndex: activeIndex)
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
