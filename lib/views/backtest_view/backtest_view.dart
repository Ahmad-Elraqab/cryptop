import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/viewmodels/backtest_viewmodel/backtest_actions.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BacktestView extends StatefulWidget {
  const BacktestView({Key? key}) : super(key: key);

  @override
  State<BacktestView> createState() => _BacktestViewState();
}

class _BacktestViewState extends State<BacktestView> {
  int? activeIndex = 0;
  setIndex(value) => setState(() => {activeIndex = value});

  List<int> selected = [];
  List<BacktestModel>? backtest;

  setItem(value) => setState(
        () {
          if (backtest![value].status == false) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar('Backtest proccess not finished yet!'));
          } else if (selected.length > 2) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar('Only three items allowed!'));
          } else {
            if (selected.contains(value) == true) {
              selected.remove(value);
            } else {
              selected.add(value);
            }
          }
        },
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
          child: Consumer(builder: (context, watch, child) {
            backtest = watch(getBacktest).data?.value;
            return BacktestBody(
              backtest: backtest,
              activeIndex: activeIndex,
              selected: selected,
              setIndex: setIndex,
              setItem: setItem,
            );
          }),
        ),
      ),
    );
  }
}
