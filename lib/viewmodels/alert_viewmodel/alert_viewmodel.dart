import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/services/alert_service.dart';
import 'package:flutter/cupertino.dart';

class AlertViewmodel extends ChangeNotifier {
  List<Alert>? alerts;
  AlertService get rest => dependency();

  Future<List<Alert>?> getAlerts() async {
    final List<Alert>? alerts = await rest.getAlerts();
    return alerts;
  }

  Future<Alert?> createAlert(Map<String, dynamic> json) async {
    final alerts = await rest.createAlert(json);
    notifyListeners();
    return alerts;
  }

  Future<Alert?> updateAlert(Map<String, dynamic> json) async {
    final alerts = await rest.updateAlert(json);
    notifyListeners();
    return alerts;
  }

  Future<Alert?> deleteAlert(String id) async {
    final alerts = await rest.deleteAlert(id);
    notifyListeners();
    return alerts;
  }
}
