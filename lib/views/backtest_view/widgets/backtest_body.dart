import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_header_action.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_list.dart';
import 'package:flutter/material.dart';

class BacktestBody extends StatelessWidget {
  const BacktestBody({
    Key? key,
    this.setIndex,
    this.selected,
    this.setItem,
    this.activeIndex,
    this.backtest,
  }) : super(key: key);
  final int? activeIndex;
  final Function? setIndex;
  final List<int>? selected;
  final List<BacktestModel>? backtest;
  final Function? setItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        const TitleHeader(isTitle: true, title: 'Backtest'),
        const SizedBox(height: 30.0),
        const BacktestHeaderAction(),
        const SizedBox(height: 20.0),
        Divider(
          color: Colors.white,
          height: 10,
        ),
        BacktestList(
          backtest: backtest,
          activeIndex: activeIndex,
          setIndex: setIndex,
          setItem: setItem,
          selected: selected,
        ),
      ],
    );
  }
}
