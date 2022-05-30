import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/viewmodels/backtest_viewmodel/backtest_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backtestViewmodel = ChangeNotifierProvider((ref) => BacktestViewmodel());

final createBacktest = FutureProviderFamily<BacktestModel?, Map>(
  (ref, Map data) async {
    final st = ref.watch(backtestViewmodel);
    final ls = data['symbols'].split(',');

    ls.removeLast();
    final obj = BacktestModel(
      startDate: DateTime.parse(data['start date'].toString()),
      endDate: DateTime.parse(data['end date'].toString()),
      failedOrders: 0,
      profit: 0,
      stopLose: double.parse(data['stop lose']),
      successfulOrders: 0,
      amount: double.parse(data['amount']),
      title: data['title'],
      buyOn: double.parse(data['buy on']),
      sellOn: double.parse(data['sell on']),
      sellRate: double.parse(data['sell rate']),
      interval: data['interval'],
      numberOfSimultaneousTrades: int.parse(data['simulated trades']),
      numberOfTrades: int.parse(data['trade count']),
      symbols: ls,
      type: data['type'],
    );
    return await st.createBacktest(obj.toJson());
  },
);

final getBacktest = FutureProvider.autoDispose<List<BacktestModel>?>(
  (ref) async {
    final st = ref.watch(backtestViewmodel);

    final result = await st.getBacktest();

    return result;
  },
);
