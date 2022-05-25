import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderViewmodel = ChangeNotifierProvider((ref) => OrderViewmodel());

final createOrder = FutureProvider.family<Order?, Map<String, dynamic>>(
  (ref, data) async {
    final order = ref.read(orderViewmodel);

    final result = await order.createOrder(data);

    return result;
  },
);
