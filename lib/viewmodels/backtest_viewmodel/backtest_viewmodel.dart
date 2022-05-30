import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/services/backtest_service.dart';
import 'package:flutter/cupertino.dart';

class BacktestViewmodel extends ChangeNotifier {
  bool? loading = false;
  List<BacktestModel>? smartTradeList;
  BacktestService get rest => dependency();

  Future<BacktestModel?> createBacktest(Map<String, dynamic> object) async {
    final BacktestModel? _st = await rest.createBacktest(object);
    notifyListeners();
    return _st;
  }

  Future<List<BacktestModel>?> getBacktest() async {
    final List<BacktestModel>? _st = await rest.getBacktest();
    return _st;
  }
}
