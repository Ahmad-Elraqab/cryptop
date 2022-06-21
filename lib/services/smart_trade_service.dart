import 'dart:convert';

import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/models/smart_trade_models/rsi_smart_trade_model.dart';
import 'package:cryptop/models/smart_trade_models/vwap_smart_trade_model.dart';
import 'package:cryptop/models/smart_trade_models/zscore_smart_trade_model.dart';
import 'package:cryptop/services/rest_service..dart';

class SmartTradeService {
  RestService get rest => dependency();

  Future<List<SmartTradeModel>?> getSmartTrade() async {
    final List json = await rest.get('smart_trade/');

    if (json.isEmpty) return [];

    final data = json.map((e) {
      if (e['type'].toLowerCase() == 'rsi') {
        return RSIModel.fromJson(e as Map<String, dynamic>);
      } else if (e['type'] == 'zscore') {
        return ZscoreModel.fromJson(e as Map<String, dynamic>);
      } else if (e['type'] == 'vwap') {
        return VWAPModel.fromJson(e as Map<String, dynamic>);
      } else {
        return SmartTradeModel.fromJson(e as Map<String, dynamic>);
      }
    }).toList();

    return data;
  }

  Future<SmartTradeModel?> createSmartTrade(Map<String, dynamic> object) async {
    final json = await rest.post('smart_trade/', object);
    if (json == null) return null;

    if (json['type'].toLowerCase() == 'rsi') {
      return RSIModel.fromJson(json as Map<String, dynamic>);
    } else if (json['type'].toLowerCase() == 'vwap') {
      return VWAPModel.fromJson(json as Map<String, dynamic>);
    } else if (json['type'].toLowerCase() == 'zscore') {
      return ZscoreModel.fromJson(json as Map<String, dynamic>);
    } else {
      return SmartTradeModel.fromJson(json as Map<String, dynamic>);
    }
  }

  Future<SmartTradeModel?> closeSmartTrade(String id) async {
    final json = await rest.delete('smart_trade/$id');

    if (json == null) {
      return null;
    } else {
      return SmartTradeModel.fromJson(json);
    }
  }

  Future<SmartTradeModel?> updateSmartTrade(
      String id, Map<String, dynamic> object) async {
    final json = await rest.patch('smart_trade/$id', data: object);

    if (json == null) {
      return null;
    } else {
      return SmartTradeModel.fromJson(json);
    }
  }

  Future getSmartTradeAdmin() async {
    final json = await rest.get('cryptop/admin');

    if (json == null) {
      return null;
    } else {
      return (json as List).map((e) => e).toList();
    }
  }

  Future getSmartTradeType() async {
    final json = await rest.get('cryptop/');

    if (json == null) {
      return null;
    } else {
      return (json as List).map((e) => e).toList();
    }
  }

  Future<SmartTradeModel?> toggleSmartTrade(String id) async {
    final json = await rest.patch('smart_trade/toggle/$id', data: {});

    if (json == null) {
      return null;
    } else {
      return SmartTradeModel.fromJson(json);
    }
  }

  Future toggleSmartTradeAdmin(String id, bool status) async {
    final json = await rest
        .patch('cryptop/?id=$id&status=${status.toString()}', data: {});

    if (json == null) {
      return null;
    } else {
      return json;
    }
  }
}
