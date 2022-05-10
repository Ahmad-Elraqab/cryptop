import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/home_view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? activeBoard = 0;

  setIndex(value) => setState(() => {activeBoard = value});

  int? activeIndexList = 0;
  setIndexList(value) => setState(() => activeIndexList = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Consumer(
          builder: (context, watch, child) {
            final data = watch(getChartList).data?.value;
            final ticker_24 = watch(get24Ticker).data?.value;
            print(ticker_24);

            return HomeBody(
              data: data,
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
