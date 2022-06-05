import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/viewmodels/alert_viewmodel/alert_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alertViewmodel = ChangeNotifierProvider((ref) => AlertViewmodel());

final createOrder = FutureProvider.family<Alert?, Map<String, dynamic>>(
  (ref, data) async {
    final order = ref.read(alertViewmodel);

    final result = await order.createAlert(data);

    return result;
  },
);
