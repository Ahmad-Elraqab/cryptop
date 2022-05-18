import 'package:cryptop/viewmodels/chart_viewmodel/chart_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
