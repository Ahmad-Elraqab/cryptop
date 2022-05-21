import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/services/rest_service..dart';

class ChartService {
  RestService get rest => dependency();

  Future<List<Chart>?> getChartList({chartList}) async {
    final List json =
        await rest.post('charts/chartsList', {'chartList': chartList});
    if (json.isEmpty) return null;

    final data =
        json.map((e) => Chart.fromJson(e as Map<String, dynamic>)).toList();

    return data;
  }

  Future get24Ticker() async {
    final List? json = await rest.get('charts/24_ticker');

    if (json == null || json.isEmpty) return null;

    final data =
        json.map((e) => Ticker.fromJson(e as Map<String, dynamic>)).toList();

    return data;
  }

  Future<Chart?> fetchCandles(String coin, String interval) async {
    final json =
        await rest.get('charts/chart?symbol=' + coin + '&interval=' + interval);

    if (json == null) {
      return null;
    }
    final data = Chart.fromJson(json);

    return data;
  }

  Future<Ticker?> getTicker(String coin) async {
    final json = await rest.get('charts/ticker?symbol=' + coin);

    if (json == null) {
      return null;
    }
    final data = Ticker.fromJson(json);

    return data;
  }
}
