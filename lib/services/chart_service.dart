import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/services/rest_service..dart';
import 'package:intl/intl.dart';

class ChartService {
  RestService get rest => dependency();

  Future<List<Chart>?> getChartList({chartList}) async {
    final List json =
        await rest.post('charts/chartsList', {'chartList': chartList});
    if (json == null || json.length == 0) return null;

    final data =
        json.map((e) => Chart.fromJson(e as Map<String, dynamic>)).toList();

    return data;
  }

  Future get24Ticker() async {
    final List? json = await rest.get('charts/24_ticker');

    if (json == null || json.length == 0) return null;

    return json;
  }
}
