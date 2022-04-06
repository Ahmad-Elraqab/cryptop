import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class MarketMovment extends StatelessWidget {
  const MarketMovment({
    Key? key,
    required this.activeIndexList,
    required this.setIndexList,
  }) : super(key: key);

  final int? activeIndexList;
  final Function? setIndexList;

  @override
  Widget build(BuildContext context) {
    final labels = ['Hot', 'Gainers', 'Losers', '24 Vol'];
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
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: 'BNBUSDT',
                        weight: FontWeight.bold,
                      ),
                      const TextComponent(
                        align: TextAlign.start,
                        fontSize: 14.0,
                        line: 1,
                        textColor: Colors.white,
                        title: '85.71',
                        weight: FontWeight.bold,
                      ),
                      CustomButtom(
                        fontSize: 14,
                        borderColor: Colors.transparent,
                        borderRadius: 5.0,
                        height: null,
                        horizontal: 8,
                        vertical: 3,
                        buttonColor:
                            index == 3 ? Colors.green[300] : Colors.red[300],
                        buttonText: '-3.72%',
                        buttonTextColor: Colors.white,
                        hasImage: false,
                        imageUrl: '',
                        onTap: () => {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
