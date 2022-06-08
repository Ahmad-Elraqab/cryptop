import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/services/rest_service..dart';

class AlertService {
  RestService get rest => dependency();

  Future<List<Alert>?> getAlerts() async {
    final List json = await rest.get('alerts/');
    if (json.isEmpty) return [];

    final data = json
        .map(
          (e) => Alert.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return data;
  }

  Future<Alert?> updateAlert(Map<String, dynamic> _json) async {
    final id = _json['id'];
    final json = await rest.patch('alerts/$id', data: _json);
    if (json.isEmpty) return null;

    final data = Alert.fromJson(json as Map<String, dynamic>);

    return data;
  }

  Future<Alert?> createAlert(Map<String, dynamic> _json) async {
    final json = await rest.post('alerts/', _json);
    if (json.isEmpty) return null;

    final data = Alert.fromJson(json as Map<String, dynamic>);

    return data;
  }

  Future<Alert?> deleteAlert(String id) async {
    final json = await rest.delete('alerts/$id');
    if (json.isEmpty) return null;

    final data = Alert.fromJson(json as Map<String, dynamic>);

    return data;
  }

  Future<Alert?> toggleAlert(String id) async {
    final json = await rest.patch('alerts/toggle/$id', data: {});
    if (json.isEmpty) return null;

    final data = Alert.fromJson(json as Map<String, dynamic>);

    return data;
  }
}
