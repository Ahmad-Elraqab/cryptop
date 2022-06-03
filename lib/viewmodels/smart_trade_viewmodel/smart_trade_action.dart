import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/viewmodels/smart_trade_viewmodel/smart_trade_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final smartTradeViewmodel =
    ChangeNotifierProvider((ref) => SmartTradeViewmodel());

final createSmartTrade = FutureProviderFamily<SmartTradeModel?, Map>(
  (ref, Map data) async {
    final st = ref.watch(smartTradeViewmodel);
    final ls = data['symbols'].split(',');

    ls.removeLast();
    final obj = SmartTradeModel(
      amount: double.parse(data['amount']),
      buyOn: double.parse(data['buy on']),
      sellOn: double.parse(data['sell on']),
      stopLose: double.parse(data['stop lose']),
      sellRate: double.parse(data['sell rate']),
      interval: data['interval'],
      numberOfSimultaneousTrades: int.parse(data['simulated trades']),
      numberOfTrades: int.parse(data['trade count']),
      symbols: ls,
      type: data['type'],
    );
    return await st.createSmartTrade(obj.toJson());
  },
);

final getSmartTrade = FutureProvider.autoDispose<List<SmartTradeModel>?>(
  (ref) async {
    final st = ref.watch(smartTradeViewmodel);

    final result = await st.getSmartTrade();

    return result;
  },
);

final toggleSmartTrade = FutureProviderFamily<SmartTradeModel?, String>(
  (ref, id) async {
    final st = ref.watch(smartTradeViewmodel);

    final result = await st.toggleSmartTrade(id);

    return result;
  },
);

final closeSmartTrade = FutureProviderFamily<SmartTradeModel?, String>(
  (ref, id) async {
    final st = ref.watch(smartTradeViewmodel);

    final result = await st.closeSmartTrade(id);

    return result;
  },
);

final updateSmartTrade = FutureProviderFamily<SmartTradeModel?, Map>(
  (ref, data) async {
    final st = ref.watch(smartTradeViewmodel);
    final ls = data['symbols'].split(',');

    ls.removeLast();
    final obj = SmartTradeModel(
      amount: double.parse(data['amount']),
      buyOn: double.parse(data['buy on']),
      sellOn: double.parse(data['sell on']),
      sellRate: double.parse(data['sell rate']),
      interval: data['interval'],
      numberOfSimultaneousTrades: int.parse(data['simulated trades']),
      numberOfTrades: int.parse(data['trade count']),
      symbols: ls,
      type: data['type'],
    );

    final result = await st.updateSmartTrade(data['id'], obj.toJson());

    return result;
  },
);
