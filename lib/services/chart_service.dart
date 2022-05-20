import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/chart_model.dart';
import 'package:cryptop/services/rest_service..dart';
import 'package:http/http.dart' as http;

class ChartService {
  RestService get rest => dependency();

  Future<List<Chart>?> getChartList({chartList}) async {
    final List json =
        await rest.post('charts/chartsList', {'chartList': chartList});
    if (json == null || json.isEmpty) return null;

    final data =
        json.map((e) => Chart.fromJson(e as Map<String, dynamic>)).toList();

    return data;
  }

  Future get24Ticker() async {
    final List? json = await rest.get('charts/24_ticker');

    if (json == null || json.isEmpty) return null;

    final data =
        json.map((e) => Chart.fromJson(e as Map<String, dynamic>)).toList();

    return data;
  }

  Future<List<Candle>?> fetchCandles(String coin, String interval) async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=${coin}&interval=${interval}&limit=100");
    final json = await http.get(uri);

    if (json.body.isEmpty) {
      return null;
    }
    final data = (jsonDecode(json.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();

    return data;
  }
}
