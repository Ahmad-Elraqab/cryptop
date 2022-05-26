import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/models/order_models/limit_order_model.dart';
import 'package:cryptop/models/order_models/oco_model.dart';
import 'package:cryptop/models/order_models/stop_limit_model.dart';
import 'package:flutter/material.dart';

class OrderListItemBody extends StatelessWidget {
  const OrderListItemBody({
    Key? key,
    this.activeIndex,
    this.close,
    this.track,
    this.order,
  }) : super(key: key);
  final Order? order;
  final int? activeIndex;
  final Function? close;
  final Function? track;

  List<Widget> buildTypeItem() {
    var data = [];
    if (order is LimitOrder) {
      data.clear();
      data.add({'input': 'Limit', 'value': (order as LimitOrder).limit});
    } else if (order is StopLimitOrder) {
      data.clear();
      data.add({'input': 'Limit', 'value': (order as StopLimitOrder).limit});
      data.add({'input': 'Stop', 'value': (order as StopLimitOrder).stop});
    } else if (order is OCOOrder) {
      data.clear();
      data.add({'input': 's_limit', 'value': (order as OCOOrder).s_limit});
      data.add({'input': 'Limit', 'value': (order as OCOOrder).limit});
      data.add({'input': 'Stop', 'value': (order as OCOOrder).stop});
    }

    return data
        .map(
          (e) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                align: TextAlign.start,
                fontSize: 9.0,
                line: 1,
                textColor: Colors.white,
                title: e['input'].toString(),
                weight: FontWeight.bold,
              ),
              TextComponent(
                align: TextAlign.start,
                fontSize: 12.0,
                line: 1,
                textColor: Colors.white,
                title: e['value'].toString(),
                weight: FontWeight.bold,
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      'start date',
      'end date',
      'amount',
      'rate',
      'buy price',
      'type'
    ];
    final values = [
      order!.openDate,
      order!.closeDate,
      order!.amount,
      order!.rate,
      order!.buyPrice,
      order!.type
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
                      title: data[i].toString(),
                      weight: FontWeight.bold,
                    ),
                    TextComponent(
                      align: TextAlign.start,
                      fontSize: 12.0,
                      line: 1,
                      textColor: Colors.white,
                      title: values[i].toString(),
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ...buildTypeItem(),
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
                buttonText: order!.rate.toString(),
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
              order!.isOpen == false
                  ? SizedBox()
                  : Column(
                      children: [
                        CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 5.0,
                          buttonColor: Colors.amberAccent[400],
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
                          buttonColor: Colors.amberAccent[400],
                          buttonText: 'Close',
                          buttonTextColor: Colors.white,
                          fontSize: 12,
                          hasImage: false,
                          height: 30.0,
                          horizontal: 4.0,
                          vertical: 4.0,
                          imageUrl: '',
                          onTap: () => close!(order!.id),
                        ),
                      ],
                    ),
            ],
          ),
        )
      ],
    );
  }
}
