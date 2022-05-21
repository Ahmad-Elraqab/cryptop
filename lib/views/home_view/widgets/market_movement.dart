import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/views/home_view/widgets/market_movement_list.dart';
import 'package:flutter/material.dart';

class MarketMovment extends StatelessWidget {
  const MarketMovment({
    Key? key,
    required this.activeIndexList,
    required this.setIndexList,
    this.ticker_24,
  }) : super(key: key);

  final int? activeIndexList;
  final Function? setIndexList;
  final List? ticker_24;

  @override
  Widget build(BuildContext context) {
    final labels = ['Losers', 'Gainers', '24 Vol'];
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(55, 61, 76, 1),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (var i = 0; i < labels.length; i++)
                  CustomButtom(
                    fontSize: 14,
                    borderColor: Colors.transparent,
                    borderRadius: 7.0,
                    height: null,
                    horizontal: 8,
                    width: 70.0,
                    vertical: 3,
                    buttonColor: i == activeIndexList
                        ? Colors.amber
                        : Colors.transparent,
                    buttonText: labels[i],
                    buttonTextColor: Colors.white,
                    hasImage: false,
                    imageUrl: '',
                    onTap: () => {setIndexList!(i)},
                  ),
              ],
            ),
            ticker_24 == null
                ? LoadingAnimation()
                : MarketMovementList(
                    activeIndexList: activeIndexList,
                    setIndexList: setIndexList,
                  ),
          ],
        ),
      ),
    );
  }
}
