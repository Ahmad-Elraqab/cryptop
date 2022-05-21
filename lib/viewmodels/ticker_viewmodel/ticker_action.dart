import 'dart:convert';

import 'package:cryptop/app/const.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/ticker_viewmodel/ticker_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final tickerViewmodel = ChangeNotifierProvider((ref) => TickerViewmodel());

final getTicker = FutureProvider.autoDispose<Ticker?>(
  (ref) async {
    final user = ref.watch(tickerViewmodel);

    final data = await user.getTicker();

    return data;
  },
);
final get24Ticker = FutureProvider<List<Ticker>?>(
  (ref) async {
    final user = ref.watch(tickerViewmodel);

    final result = await user.get24Ticker();

    return result;
  },
);

final messageProvider = StreamProvider<dynamic>((ref) async* {
  var url = '';
  for (var item in exchange_pairs) {
    url += item.toLowerCase() + '@ticker/';
  }
  final user = ref.watch(tickerViewmodel);

  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/stream?streams=' +
          url.substring(0, url.length - 1));

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    yield jsonDecode(value.toString());
    // user.updateTickers(jsonDecode(value.toString()));
  }
});

final tickerProvider = StreamProvider.autoDispose<dynamic>(
  (ref) async* {
    final user = ref.watch(tickerViewmodel);

    final channel = IOWebSocketChannel.connect(
        'wss://stream.binance.com:9443/stream?streams=' +
            user.coin.toLowerCase() +
            '@ticker');
    ref.onDispose(() => {channel.sink.close()});

    await for (final value in channel.stream) {
      yield jsonDecode(value.toString());
      // user.updateTicker(jsonDecode(value.toString()));
    }
  },
);
