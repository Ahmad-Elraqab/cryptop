import 'dart:async';

import 'package:cryptop/views/home_view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController? searchController = TextEditingController();
  search(value) => setState(() => searchController!.text = value);
  int? activeBoard = 0;
  double? opacity_ = 1;
  Random? rnd = Random();
  int? min = 0;
  int? max = 5;
  setOpacity(value) {
    setState(() => {
          activeBoard =
              opacity_ == 0 ? min! + rnd!.nextInt(max! - min!) : activeBoard,
          opacity_ = double.parse(
            value.toString(),
          ),
        });
  }

  int? activeIndexList = 0;
  setIndexList(value) => setState(() => activeIndexList = value);
  bool loading = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2), () async {
      setState(() {
        opacity_ = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: HomeBody(
          search: search,
          searchController: searchController!,
          opacity_: opacity_!,
          setOpacity: setOpacity,
          activeBoard: activeBoard!,
          loading: loading,
          setIndexList: setIndexList,
          activeIndexList: activeIndexList,
        ),
      ),
    );
  }
}
