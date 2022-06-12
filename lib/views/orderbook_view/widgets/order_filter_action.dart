import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_header_filter.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list.dart';
import 'package:flutter/material.dart';

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
