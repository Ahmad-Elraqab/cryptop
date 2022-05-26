import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_header_filter.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderFilterAction extends StatelessWidget {
  const OrderFilterAction({
    Key? key,
    this.orderType,
    this.activeIndex,
    this.setIndex,
    this.setFilter,
    this.filter,
    this.close,
    this.track,
    this.setItem,
    this.item,
    this.orderList,
  }) : super(key: key);

  final List<String>? orderType;
  final Function? setItem;
  final int? item;
  final int? activeIndex;
  final String? filter;
  final List<Order>? orderList;
  final Function? setIndex;
  final Function? setFilter;
  final Function? close;
  final Function? track;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.arrowsUpDown,
                size: 12,
                color: Colors.amberAccent,
              ),
              Expanded(
                child: Container(
                  height: 30.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderType!.length,
                    itemBuilder: (context, index) => CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: activeIndex == index
                          ? Colors.amber
                          : const Color.fromRGBO(55, 61, 76, 1),
                      buttonText: orderType![index],
                      buttonTextColor: Colors.white,
                      fontSize: 12,
                      hasImage: false,
                      horizontal: 16.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: () => setIndex!(index),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(thickness: 1, color: Colors.white, height: 15),
          OrderHeaderFilter(filter: filter, setFilter: setFilter),
          OrderList(
            orderList: orderList,
            activeItem: item,
            setItem: setItem,
            close: close,
            track: track,
          ),
        ],
      ),
    );
  }
}
