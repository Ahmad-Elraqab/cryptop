import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list_item_body.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
    this.setIndex,
    this.activeIndex,
    this.close,
    this.track,
  }) : super(key: key);

  final Function? close;
  final Function? track;
  final Function? setIndex;
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () => setIndex!(index),
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
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: 'BTCUSDT',
                      weight: FontWeight.bold,
                    ),
                    activeIndex == index
                        ? const SizedBox()
                        : CustomButtom(
                            borderColor: Colors.transparent,
                            borderRadius: 5.0,
                            buttonColor: index == 4
                                ? const Color.fromARGB(255, 250, 131, 125)
                                : const Color.fromARGB(188, 94, 242, 212),
                            buttonText: '9.54%',
                            buttonTextColor: Colors.white,
                            fontSize: 12,
                            hasImage: false,
                            height: 30.0,
                            horizontal: 10.0,
                            vertical: 4.0,
                            imageUrl: '',
                            onTap: () => {},
                          ),
                  ],
                ),
                activeIndex == index
                    ? OrderListItemBody(
                        activeIndex: activeIndex, close: close, track: track)
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
