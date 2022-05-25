import 'package:cryptop/viewmodels/order_viewmodel/order_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tradeViewmodel = ChangeNotifierProvider((ref) => OrderViewmodel());
