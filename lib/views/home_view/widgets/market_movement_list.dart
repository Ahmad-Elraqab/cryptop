import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../components/custom_buttom/custom_button.dart';

class MarketMovementList extends StatefulWidget {
  const MarketMovementList({Key? key, this.activeIndexList, this.setIndexList})
      : super(key: key);

  final int? activeIndexList;
  final Function? setIndexList;
  @override
  State<MarketMovementList> createState() => _MarketMovementListState();
}

class _MarketMovementListState extends State<MarketMovementList> {
  // ignore: prefer_typing_uninitialized_variables
  var _channel;
  var url = '';
  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    for (var item in exchange_pairs) {
      url += item.toLowerCase() + '@ticker/';
    }
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/stream?streams=' +
          url.substring(0, url.length - 1)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(messageProvider).when(
          loading: () => const Center(child: LoadingAnimation()),
          error: (_, erorr) => const Text('error'),
          data: (_data) {
            final data = context
                .read(chartViewmodel)
                .sort(widget.activeIndexList, _data);
            return data.isEmpty
                ? const LoadingAnimation()
                : Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextComponent(
                                align: TextAlign.start,
                                fontSize: 14.0,
                                line: 1,
                                textColor: Colors.white,
                                title: data[index].symbol,
                                weight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: TextComponent(
                                align: TextAlign.start,
                                fontSize: 14.0,
                                line: 1,
                                textColor: Colors.white,
                                title: double.parse(
                                        data[index].lastPrice.toString())
                                    .toStringAsFixed(4),
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 80.0,
                              child: CustomButtom(
                                fontSize: 14,
                                borderColor: Colors.transparent,
                                borderRadius: 5.0,
                                height: null,
                                horizontal: 8,
                                width: 100.0,
                                vertical: 3,
                                buttonColor: widget.activeIndexList == 1
                                    ? Colors.green[300]
                                    : widget.activeIndexList == 0
                                        ? Colors.red[300]
                                        : Colors.yellow[700],
                                buttonText: (NumberFormat.compact().format(
                                      double.parse(
                                        widget.activeIndexList == 2
                                            ? data[index].volume.toString()
                                            : data[index].rate.toString(),
                                      ),
                                    ) +
                                    (widget.activeIndexList == 2 ? '' : ' %')),
                                buttonTextColor: Colors.white,
                                hasImage: false,
                                imageUrl: '',
                                onTap: () => {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
