import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list_item_body.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
    this.setItem,
    this.activeItem,
    this.close,
    this.track,
    this.orderList,
  }) : super(key: key);

  final Function? close;
  final Function? track;
  final Function? setItem;
  final List<Order>? orderList;
  final int? activeItem;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: orderList!.isEmpty
          ? SizedBox(
              height: 100.0,
              width: 100.0,
              child: Image.asset('lib/assets/logo.png'),
            )
          : ListView.builder(
              itemCount: orderList!.length,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (context, index) => InkWell(
                onTap: () => setItem!(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextComponent(
                            align: TextAlign.start,
                            fontSize: 14.0,
                            line: 1,
                            textColor: Colors.white,
                            title: orderList![index].symbol,
                            weight: FontWeight.bold,
                          ),
                          Container(
                            width: 70.0,
                            child: CustomButtom(
                              borderColor: Colors.transparent,
                              borderRadius: 5.0,
                              buttonColor: orderList![index].op == 'sell'
                                  ? const Color.fromARGB(255, 250, 131, 125)
                                  : const Color.fromARGB(188, 94, 242, 212),
                              buttonText: orderList![index].op == 'sell'
                                  ? 'sell'
                                  : 'buy',
                              buttonTextColor: Colors.white,
                              fontSize: 12,
                              hasImage: false,
                              height: 30.0,
                              horizontal: 10.0,
                              width: 70.0,
                              vertical: 4.0,
                              imageUrl: '',
                              onTap: () => {},
                            ),
                          ),
                        ],
                      ),
                      activeItem == index
                          ? OrderListItemBody(
                              order: orderList![index],
                              activeIndex: activeItem,
                              close: close,
                              track: track)
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
