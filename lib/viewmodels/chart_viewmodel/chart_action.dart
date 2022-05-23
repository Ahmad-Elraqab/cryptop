import 'dart:convert';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import '../../models/chart_model.dart';

final chartViewmodel =
    ChangeNotifierProvider((ref) => ChartViewmodel()..init());

final getChartList = FutureProvider<List<Chart>?>(
  (ref) async {
    final user = ref.watch(chartViewmodel);

    final result = await user.getChartList();

    return result;
  },
);

final getKlines = FutureProvider.autoDispose<Chart?>(
  (ref) async {
    final user = ref.watch(chartViewmodel);

    final data = await user.fetchCandles();

    return data;
  },
);

final klineProvider = StreamProvider.autoDispose<dynamic>((ref) async* {
  final user = ref.watch(chartViewmodel);

  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/stream?streams=' +
          user.coin!.toLowerCase() +
          '@kline_' +
          user.interval!.toLowerCase());

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    yield jsonDecode(value.toString());
    // user.updateCandle(jsonDecode(value.toString()));
  }
});
