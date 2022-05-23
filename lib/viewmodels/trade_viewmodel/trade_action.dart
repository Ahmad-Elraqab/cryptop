import 'dart:convert';

import 'package:cryptop/app/const.dart';
import 'package:cryptop/viewmodels/trade_viewmodel/trade_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final tradeViewmodel =
    ChangeNotifierProvider((ref) => TradeViewmodel()..init());

final messageProvider = StreamProvider.autoDispose<dynamic>((ref) async* {
  var url = '';
  for (var item in exchange_pairs) {
    url += item.toLowerCase() + '@ticker/';
  }

  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/stream?streams=' +
          url.substring(0, url.length - 1));

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    yield jsonDecode(value.toString());
    // user.updateTickers(jsonDecode(value.toString()));
  }
});
