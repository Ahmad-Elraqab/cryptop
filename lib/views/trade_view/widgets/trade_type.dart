import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class TradeType extends StatelessWidget {
  const TradeType({
    Key? key,
    required this.labels,
    required this.activeIndexList,
    this.setIndexList,
  }) : super(key: key);

  final List<String>? labels;
  final int? activeIndexList;
  final Function? setIndexList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(55, 61, 76, 1),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          for (var i = 0; i < labels!.length; i++)
            CustomButtom(
              fontSize: 14,
              borderColor: Colors.transparent,
              borderRadius: 7.0,
              height: null,
              horizontal: 8,
              vertical: 3,
              buttonColor:
                  i == activeIndexList ? Colors.amber : Colors.transparent,
              buttonText: labels![i],
              buttonTextColor: Colors.white,
              hasImage: false,
              imageUrl: '',
              onTap: () => {setIndexList!(i)},
            ),
        ],
      ),
    );
  }
}
