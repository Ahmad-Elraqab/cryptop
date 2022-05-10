import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/views/home_view/widgets/market_movement.dart';
import 'package:cryptop/views/home_view/widgets/pair_board.dart';
import 'package:cryptop/views/home_view/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    this.activeBoard,
    this.setIndexList,
    this.activeIndexList,
    this.data,
    this.setIndex,
    this.ticker_24,
  }) : super(key: key);

  final Function? setIndex;
  final Function? setIndexList;
  final int? activeBoard;
  final int? activeIndexList;
  final List? ticker_24;
  final List<Chart>? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBar(),
        PairBoard(
          activeBoard: activeBoard!,
          data: data,
          setIndex: setIndex,
        ),
        Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(
                align: TextAlign.start,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.black,
                title: 'Market Movement',
                weight: FontWeight.w600,
              ),
              InkWell(
                onTap: () => {},
                child: const TextComponent(
                  align: TextAlign.start,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.black,
                  title: 'See all',
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        MarketMovment(
          ticker_24: ticker_24,
          activeIndexList: activeIndexList,
          setIndexList: setIndexList,
        ),
        const Divider(
          thickness: 2,
          height: 1,
          color: Colors.white,
        )
      ],
    );
  }
}
