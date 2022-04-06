import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'widgets/order_header_filter.dart';

class OrderbookView extends StatefulWidget {
  const OrderbookView({Key? key}) : super(key: key);

  @override
  State<OrderbookView> createState() => _OrderbookViewState();
}

class _OrderbookViewState extends State<OrderbookView> {
  int? activeIndex;
  setIndex(value) => setState(() => {activeIndex = value, print(value)});
  track() => {};
  close() => {};
  filter() => {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const TitleHeader(
                isTitle: true,
                title: 'Open Orders',
              ),
              const Divider(
                color: Colors.white,
                height: 10.0,
                thickness: 1,
              ),
              const SizedBox(height: 20.0),
              OrderHeaderFilter(filter: filter),
              OrderList(
                activeIndex: activeIndex,
                setIndex: setIndex,
                close: close,
                track: track,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
