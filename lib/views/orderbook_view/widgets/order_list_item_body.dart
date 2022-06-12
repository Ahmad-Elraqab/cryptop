import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/models/order_models/limit_order_model.dart';
import 'package:cryptop/models/order_models/oco_model.dart';
import 'package:cryptop/models/order_models/stop_limit_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      'symbol',
      'amount',
      'quantity',
      'price',
      'trade type',
      'type',
      'start date',
    ];
    final values = [
      order!.symbol,
      order!.amount,
      order!.qAmount,
      order!.price,
      order!.op,
      order!.type,
      order!.date,
    ];
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  align: TextAlign.start,
                  fontSize: 9.0,
                  line: 1,
                  textColor: Colors.white,
                  title: data[index].toString(),
                  weight: FontWeight.bold,
                ),
                TextComponent(
                  align: TextAlign.start,
                  fontSize: 12.0,
                  line: 1,
                  textColor: Colors.white,
                  title: values[index].toString(),
                  weight: FontWeight.bold,
                ),
              ],
            ),
            // ...buildTypeItem(),
          ),
        ),
      ],
    );
  }
}
