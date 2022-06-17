import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/models/backtest_models/rsi_backtest_model.dart';
import 'package:cryptop/models/backtest_models/vwap_backtest_model.dart';
import 'package:cryptop/models/backtest_models/zscore_backtest_model.dart';
import 'package:cryptop/services/rest_service..dart';

class BacktestService {
  RestService get rest => dependency();

  Future<List<BacktestModel>?> getBacktest() async {
    final List json = await rest.get('backtests/');

    if (json.isEmpty) return [];

    final data = json.map((e) {
      if (e['type'].toLowerCase() == 'rsi') {
        return RSIBacktestModel.fromJson(e as Map<String, dynamic>);
      } else if (e['type'].toLowerCase() == 'zscore') {
        return ZscoreBacktestModel.fromJson(e as Map<String, dynamic>);
      } else if (e['type'].toLowerCase() == 'vwap') {
        return VWAPBacktestModel.fromJson(e as Map<String, dynamic>);
      } else {
        return BacktestModel.fromJson(e as Map<String, dynamic>);
      }
    }).toList();

    return data;
  }

  Future<BacktestModel?> createBacktest(Map<String, dynamic> object) async {
    final json = await rest.post('backtests/', object);
    if (json == null) return null;

    if (json['type'].toLowerCase() == 'rsi') {
      return RSIBacktestModel.fromJson(json as Map<String, dynamic>);
    } else if (json['type'].toLowerCase() == 'vwap') {
      return VWAPBacktestModel.fromJson(json as Map<String, dynamic>);
    } else if (json['type'].toLowerCase() == 'zscore') {
      return ZscoreBacktestModel.fromJson(json as Map<String, dynamic>);
    } else {
      return BacktestModel.fromJson(json as Map<String, dynamic>);
    }
  }
}
