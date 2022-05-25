import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestService {
  final String _baseUrl;
  const RestService({baseUrl}) : _baseUrl = baseUrl;

  // Send a GET request to retrieve data from a REST server
  Future<Object> readToken() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    final token = _storage.get('token');

    if (token == null) return false;
    return token;
  }

  Future get(dynamic endpoint) async {
    final token = await readToken();
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future post(dynamic endpoint, Map<String, dynamic> data) async {
    final token = await readToken();
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future patch(String endpoint, {dynamic data}) async {
    final token = await readToken();
    final response = await http.patch(Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future delete(String endpoint) async {
    final token = await readToken();
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }
}
