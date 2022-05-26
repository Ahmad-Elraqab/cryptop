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

  Future<Order?> closeOrder(String orderId) async {
    final Order? _order = await rest.closeOrder(orderId);

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
        orders.sort((a, b) => a.openDate!.compareTo(b.openDate!));
        break;
      case 'D_DOWN':
        orders.sort((a, b) => b.openDate!.compareTo(a.openDate!));
        break;
      case 'C_UP':
        orders.sort((a, b) => a.rate!.compareTo(b.rate!));
        break;
      case 'C_DOWN':
        orders.sort((a, b) => b.rate!.compareTo(a.rate!));
        break;
      case 'P_UP':
        return orders.where((e) => e.isOpen == true).toList();
      case 'P_DOWN':
        return orders.where((e) => e.isClose == true).toList();
      default:
    }
    return orders;
  }

  List<Order> getSortedHistoricalOrders() {
    orders!.sort((a, b) => a.symbol!.compareTo(b.symbol!));

    return orders!;
  }
}
