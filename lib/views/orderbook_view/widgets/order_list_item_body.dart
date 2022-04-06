import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class OrderListItemBody extends StatelessWidget {
  const OrderListItemBody({
    Key? key,
    this.activeIndex,
    this.close,
    this.track,
  }) : super(key: key);
  final int? activeIndex;
  final Function? close;
  final Function? track;
  @override
  Widget build(BuildContext context) {
    final data = [
      {'input': 'start date', 'value': '01-12-2020'},
      {'input': 'end date', 'value': '01-12-2020'},
      {'input': 'amount', 'value': '500\$'},
      {'input': 'buy price', 'value': '42,452.45'},
      {'input': 'sell price', 'value': '43,124.45'},
      {'input': 'technique', 'value': 'RSI'},
    ];
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 3,
            mainAxisSpacing: 20.0,
            children: [
              for (int i = 0; i < 6; i++)
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
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomButtom(
                borderColor: Colors.transparent,
                borderRadius: 5.0,
                buttonColor: activeIndex == 4
                    ? const Color.fromARGB(255, 250, 131, 125)
                    : const Color.fromARGB(188, 94, 242, 212),
                buttonText: '9.54%',
                buttonTextColor: Colors.white,
                fontSize: 12,
                hasImage: false,
                height: 30.0,
                horizontal: 4.0,
                vertical: 4.0,
                imageUrl: '',
                onTap: () => {},
              ),
              const SizedBox(height: 5.0),
              CustomButtom(
                borderColor: Colors.transparent,
                borderRadius: 5.0,
                buttonColor: const Color.fromRGBO(55, 61, 76, 1),
                buttonText: 'Track',
                buttonTextColor: Colors.white,
                fontSize: 12,
                hasImage: false,
                height: 30.0,
                horizontal: 4.0,
                vertical: 4.0,
                imageUrl: '',
                onTap: () => track!(),
              ),
              const SizedBox(height: 5.0),
              CustomButtom(
                borderColor: Colors.transparent,
                borderRadius: 5.0,
                buttonColor: const Color.fromRGBO(55, 61, 76, 1),
                buttonText: 'Close',
                buttonTextColor: Colors.white,
                fontSize: 12,
                hasImage: false,
                height: 30.0,
                horizontal: 4.0,
                vertical: 4.0,
                imageUrl: '',
                onTap: () => close!(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
