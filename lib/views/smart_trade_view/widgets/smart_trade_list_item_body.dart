import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class SmartTradeListItemBody extends StatelessWidget {
  const SmartTradeListItemBody({
    Key? key,
    this.activeIndex,
    this.edit,
    this.delete,
    this.status,
  }) : super(key: key);
  final int? activeIndex;
  final Function? status;
  final Function? edit;
  final Function? delete;
  @override
  Widget build(BuildContext context) {
    final data = [
      {'input': 'start date', 'value': '01-12-2020'},
      {'input': 'end date', 'value': '01-12-2020'},
      {'input': 'amount', 'value': '500\$'},
      {'input': 'buy price', 'value': '42,452.45'},
      {'input': 'sell price', 'value': '43,124.45'},
      {'input': 'technique', 'value': 'RSI'},
      {'input': 'amount', 'value': '500'},
      {'input': 'trade count', 'value': '10'},
      {'input': 'rate', 'value': '6.54%'},
    ];

    final buttons = ['Active', 'Edit', 'Delete', 'View Details'];
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: 3,
          mainAxisSpacing: 20.0,
          children: [
            for (int i = 0; i < data.length; i++)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 9.0,
                    line: 1,
                    textColor: Colors.white,
                    title: data[i]['input'].toString(),
                    weight: FontWeight.bold,
                  ),
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 12.0,
                    line: 1,
                    textColor: Colors.white,
                    title: data[i]['value'].toString(),
                    weight: FontWeight.bold,
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < buttons.length; i++)
              CustomButtom(
                borderColor: Colors.transparent,
                borderRadius: 5.0,
                buttonColor: i == 0 ? Colors.amber : Colors.grey,
                buttonText: buttons[i],
                buttonTextColor: Colors.white,
                fontSize: 12,
                hasImage: false,
                height: 30.0,
                horizontal: 16.0,
                vertical: 4.0,
                imageUrl: '',
                onTap: () => status!(),
              ),
          ],
        )
      ],
    );
  }
}
