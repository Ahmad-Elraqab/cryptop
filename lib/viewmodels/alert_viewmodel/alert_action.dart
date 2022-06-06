import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/viewmodels/alert_viewmodel/alert_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alertViewmodel = ChangeNotifierProvider((ref) => AlertViewmodel());

final getAlerts = FutureProvider.autoDispose<List<Alert>?>(
  (ref) async {
    final alerts = ref.watch(alertViewmodel);

    final result = await alerts.getAlerts();

    return result;
  },
);

final createAlerts = FutureProviderFamily<Alert?, Map<String, dynamic>>(
  (ref, data) async {
    final alerts = ref.watch(alertViewmodel);

    final result = await alerts.createAlert(data);

    return result;
  },
);

final updateAlert = FutureProviderFamily<Alert?, Map<String, dynamic>>(
  (ref, data) async {
    final alerts = ref.watch(alertViewmodel);

    final result = await alerts.updateAlert(data);

    return result;
  },
);

final toggleAlert = FutureProviderFamily<Alert?, String>(
  (ref, id) async {
    final alerts = ref.watch(alertViewmodel);

    final result = await alerts.toggleAlert(id);

    return result;
  },
);

final deleteAlert = FutureProviderFamily<Alert?, String>(
  (ref, id) async {
    final alerts = ref.watch(alertViewmodel);

    final result = await alerts.deleteAlert(id);

    return result;
  },
);
