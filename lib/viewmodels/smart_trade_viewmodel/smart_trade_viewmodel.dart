import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/services/smart_trade_service.dart';
import 'package:flutter/cupertino.dart';

class SmartTradeViewmodel extends ChangeNotifier {
  bool? loading = false;
  List<SmartTradeModel>? smartTradeList;
  SmartTradeService get rest => dependency();

  Future<SmartTradeModel?> createSmartTrade(Map<String, dynamic> object) async {
    final SmartTradeModel? _st = await rest.createSmartTrade(object);
    notifyListeners();
    return _st;
  }

  Future<SmartTradeModel?> closeSmartTrade(String id) async {
    final SmartTradeModel? _st = await rest.closeSmartTrade(id);
    notifyListeners();
    return _st;
  }

  Future<SmartTradeModel?> updateSmartTrade(
      String id, Map<String, dynamic> object) async {
    final SmartTradeModel? _st = await rest.updateSmartTrade(id, object);
    notifyListeners();
    return _st;
  }

  Future<SmartTradeModel?> toggleSmartTrade(id) async {
    final SmartTradeModel? _st = await rest.toggleSmartTrade(id);
    notifyListeners();
    return _st;
  }

  Future<List<SmartTradeModel>?> getSmartTrade() async {
    final List<SmartTradeModel>? _st = await rest.getSmartTrade();
    return _st;
  }
}
