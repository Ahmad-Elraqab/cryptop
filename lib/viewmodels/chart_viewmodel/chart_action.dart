import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/app/const.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import '../../models/chart_model.dart';

final chartViewmodel = ChangeNotifierProvider((ref) => ChartViewmodel());

final getChartList = FutureProvider<List<Chart>?>(
  (ref) async {
    final user = ref.watch(chartViewmodel);

    final result = await user.getChartList();

    return result;
  },
);

final get24Ticker = FutureProvider<List?>(
  (ref) async {
    final user = ref.watch(chartViewmodel);

    final result = await user.get24Ticker();

    return result;
  },
);

final getKlines = FutureProvider.autoDispose<List<Candle>?>(
  (ref) async {
    final user = ref.watch(chartViewmodel);

    final data = await user.fetchCandles();

    return data;
  },
);

final messageProvider = StreamProvider<String>((ref) async* {
  var url = '';
  for (var item in exchange_pairs) {
    url += item.toLowerCase() + '@ticker/';
  }

  // Open the connection
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/stream?streams=' +
          url.substring(0, url.length - 1));

  // Close the connection when the stream is destroyed
  ref.onDispose(() => channel.sink.close());

  // Parse the value received and emit a Message instance
  await for (final value in channel.stream) {
    yield value.toString();
  }
});
