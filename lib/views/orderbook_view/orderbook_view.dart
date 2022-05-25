import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_action.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/order_header_filter.dart';

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
  close() => {};
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
                          : Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: orderType.length,
                                      itemBuilder: (context, index) =>
                                          CustomButtom(
                                        borderColor: Colors.transparent,
                                        borderRadius: 5.0,
                                        buttonColor: activeIndex == index
                                            ? Colors.amber
                                            : const Color.fromRGBO(
                                                55, 61, 76, 1),
                                        buttonText: orderType[index],
                                        buttonTextColor: Colors.white,
                                        fontSize: 12,
                                        hasImage: false,
                                        horizontal: 16.0,
                                        vertical: 4.0,
                                        imageUrl: '',
                                        onTap: () => setIndex(index),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Divider(
                                      thickness: 1,
                                      color: Colors.white,
                                      height: 15),
                                  OrderHeaderFilter(
                                      filter: filter, setFilter: setFilter),
                                  OrderList(
                                    orderList: watch(orderViewmodel)
                                        .getSortedOpenOrders(
                                            activeIndex, filter),
                                    activeItem: activeItem,
                                    setItem: setItem,
                                    close: close,
                                    track: track,
                                  ),
                                ],
                              ),
                            ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
