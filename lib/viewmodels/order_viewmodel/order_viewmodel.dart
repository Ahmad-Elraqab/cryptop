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

  Future<bool> closeOrder(String orderId) async {
    final bool _order = await rest.closeOrder(orderId);
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

  List<Order> getSortedOpenOrders() {
    orders!.sort((a, b) => a.symbol!.compareTo(b.symbol!));

    return orders!;
  }

  List<Order> getSortedHistoricalOrders() {
    orders!.sort((a, b) => a.symbol!.compareTo(b.symbol!));

    return orders!;
  }
}
