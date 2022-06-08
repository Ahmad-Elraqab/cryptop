import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_action.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_filter_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderbookView extends StatefulWidget {
  const OrderbookView({Key? key}) : super(key: key);

  @override
  State<OrderbookView> createState() => _OrderbookViewState();
}

class _OrderbookViewState extends State<OrderbookView> {
  int? activeItem = 0;
  setItem(value) => setState(() => {activeItem = value});

  int? activeIndex = 0;
  setIndex(value) => setState(() => {activeIndex = value});

  String? filter = 'N_UP';
  setFilter(value) => setState(() => {filter = value});

  final orderType = ['All', 'Market', 'Limit', 'Stop Lose', 'OCO'];

  track() => {};
  close(order) async {
    await context.read(closeOrder(order));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, watch, child) {
            final openOrders = watch(getOrders).data?.value;
            return Container(
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
                    title: 'Order Book',
                  ),
                  const SizedBox(height: 20.0),
                  openOrders == null
                      ? Expanded(child: LoadingAnimation())
                      : openOrders.isEmpty
                          ? Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: 100.0,
                                  width: 100.0,
                                  child: Image.asset('lib/assets/logo.png'),
                                ),
                              ),
                            )
                          : OrderFilterAction(
                              orderType: orderType,
                              activeIndex: activeIndex,
                              setIndex: setIndex,
                              item: activeItem,
                              setItem: setItem,
                              orderList: watch(orderViewmodel)
                                  .getSortedOpenOrders(activeIndex, filter),
                              filter: filter,
                              setFilter: setFilter,
                              close: close,
                              track: track,
                            )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
