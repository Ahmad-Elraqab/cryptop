import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/services/order_service.dart';
import 'package:flutter/material.dart';

class OrderViewmodel extends ChangeNotifier {
  List<Order>? orders;
  List<Order>? historicalOrders;
  OrderService get rest => dependency();

  Future<Order?> createOrder(Map<String, dynamic> order) async {
    final Order? _order = await rest.createOrder(order);
    return _order;
  }

  Future<Order?> createOrderAdmin(Map<String, dynamic> order) async {
    final Order? _order = await rest.createOrderAdmin(order);
    return _order;
  }

  Future<Order?> closeOrder(Order obj) async {
    final data = {
      'symbol': obj.symbol,
      'qAmount': obj.qAmount,
    };
    final Order? _order = await rest.closeOrder(obj.id!, data);

    orders!.removeWhere((element) => element.id == _order!.id);

    notifyListeners();
    return _order;
  }

  Future<Order?> getOrder(orderId) async {
    final Order? _order = await rest.getOrder(orderId);
    return _order;
  }

  Future<List<Order>?> getHistoricalOrder() async {
    final List<Order>? _orderList = await rest.getHistoricalOrders();
    return _orderList;
  }

  Future<List<Order>?> getOpenOrders() async {
    orders = await rest.getOpenOrders();

    return orders;
  }

  List<Order> getSortedOpenOrders(activeIndex, filter) {
    switch (activeIndex) {
      case 0:
        return getFilterOrders(orders!.toList(), filter);
      case 1:
        return getFilterOrders(
            orders!.where((e) => e.type == 'market').toList(), filter);
      case 2:
        return getFilterOrders(
            orders!.where((e) => e.type == 'limit').toList(), filter);
      case 3:
        return getFilterOrders(
            orders!.where((e) => e.type == 'stopLose').toList(), filter);
      case 4:
        return getFilterOrders(
            orders!.where((e) => e.type == 'oco').toList(), filter);
      default:
        return getFilterOrders(orders!.toList(), filter);
    }
  }

  List<Order> getFilterOrders(List<Order> orders, filter) {
    switch (filter) {
      case 'N_UP':
        orders.sort((a, b) => a.symbol!.compareTo(b.symbol!));
        break;
      case 'N_DOWN':
        orders.sort((a, b) => b.symbol!.compareTo(a.symbol!));
        break;
      case 'D_UP':
        orders.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'D_DOWN':
        orders.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      case 'A_DOWN':
        orders.sort((a, b) => b.amount!.compareTo(a.amount!));
        break;
      case 'A_UP':
        orders.sort((a, b) => a.amount!.compareTo(b.amount!));
        break;
      case 'P_UP':
        return orders.where((e) => e.pending == true).toList();
      case 'P_DOWN':
        return orders.where((e) => e.pending == false).toList();
      default:
    }
    return orders;
  }

  List<Order> getSortedHistoricalOrders() {
    orders!.sort((a, b) => a.symbol!.compareTo(b.symbol!));

    return orders!;
  }
}
