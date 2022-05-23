import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/home_view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/ticker_viewmodel/ticker_action.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  setIndex(value) => setState(() => {activeBoard = value});
  setIndexList(value) => setState(() => activeIndexList = value);
  int? activeBoard = 0;
  int? activeIndexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Consumer(
          builder: (context, watch, child) {
            List<Chart>? charts = watch(chartViewmodel).favoriteCharts;
            List<Ticker>? ticker_24 =
                watch(tickerViewmodel).getSortedTicker(activeIndexList == 0
                    ? 'C_UP'
                    : activeIndexList == 1
                        ? 'C_DOWN'
                        : 'V_UP');

            watch(messageProvider).whenData(
                (value) => {watch(tickerViewmodel).updateTickers(value)});

            return HomeBody(
              data: charts,
              ticker_24: ticker_24,
              activeBoard: activeBoard!,
              setIndex: setIndex,
              setIndexList: setIndexList,
              activeIndexList: activeIndexList,
            );
          },
        ),
      ),
    );
  }
}
