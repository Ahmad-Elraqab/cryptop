import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/home_view/widgets/market_movement.dart';
import 'package:cryptop/views/home_view/widgets/pair_board.dart';
import 'package:cryptop/views/home_view/widgets/app_bar.dart';
import 'package:cryptop/views/home_view/widgets/search.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    this.searchController,
    this.search,
    this.opacity_,
    this.setOpacity,
    this.activeBoard,
    this.loading,
    this.setIndexList,
    this.activeIndexList,
  }) : super(key: key);

  final TextEditingController? searchController;
  final Function? search;
  final Function? setIndexList;
  final Function? setOpacity;
  final double? opacity_;
  final int? activeBoard;
  final int? activeIndexList;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBar(),
        Search(searchController: searchController, search: search),
        Container(
          height: 50,
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: null,
        ),
        GestureDetector(
          onTap: () => setOpacity!(opacity_ == 1 ? 0 : 1),
          child: PairBoard(
            opacity_: opacity_!,
            setOpacity: setOpacity!,
            activeBoard: activeBoard!,
            loading: loading!,
          ),
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
