import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_list_item.dart';
import 'package:flutter/material.dart';

class BacktestList extends StatelessWidget {
  const BacktestList({
    Key? key,
    this.setIndex,
    this.activeIndex,
    this.selected,
    this.setItem,
    this.backtest,
  }) : super(key: key);

  final List<BacktestModel>? backtest;
  final List<int>? selected;
  final Function? setItem;
  final Function? setIndex;
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: backtest == null
          ? LoadingAnimation()
          : backtest!.isEmpty
              ? Center(
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset('lib/assets/logo.png'),
                  ),
                )
              : ListView.builder(
                  itemCount: backtest!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => setIndex!(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
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
                                    unselectedWidgetColor:
                                        Colors.red, // Your color
                                  ),
                                ),
                              ),
                            ],
                          ),
                          activeIndex == index
                              ? BacktestListItemBody(
                                  activeIndex: activeIndex,
                                  backtest: backtest![index])
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
