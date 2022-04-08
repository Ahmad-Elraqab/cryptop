import 'package:cryptop/views/backtest_view/widgets/backtest_body.dart';
import 'package:flutter/material.dart';

class BacktestView extends StatefulWidget {
  const BacktestView({Key? key}) : super(key: key);

  @override
  State<BacktestView> createState() => _BacktestViewState();
}

class _BacktestViewState extends State<BacktestView> {
  int? activeIndex;
  setIndex(value) => setState(() => {activeIndex = value, print(value)});

  List<int> selected = [];

  setItem(value) => setState(
        () => selected.contains(value) == true
            ? selected.remove(value)
            : selected.add(value),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(55, 61, 76, 1),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BacktestBody(
            activeIndex: activeIndex,
            selected: selected,
            setIndex: setIndex,
            setItem: setItem,
          ),
        ),
      ),
    );
  }
}
