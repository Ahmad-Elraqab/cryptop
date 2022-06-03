import 'dart:async';
import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewmodel extends ChangeNotifier {
  User? user;
  UserService get rest => dependency();
  SharedPreferences? _storage;

  bool loading = false;
  bool checkbox = false;
  bool get load => loading;
  final List<TextEditingController> controllers =
      List.generate(7, (i) => TextEditingController());

  final validators = [
    {'value': false, 'message': 'fill in email!'},
    {'value': false, 'message': 'fill in password!'},
    {'value': false, 'message': 'fill in first name'},
    {'value': false, 'message': 'fill in last name'},
    {'value': false, 'message': 'fill in email'},
    {'value': false, 'message': 'fill in password'},
    {'value': false, 'message': 'repeat password'},
  ];

  Future readToken() async {
    _storage = await SharedPreferences.getInstance();

    final token = _storage!.get('token');

    if (token == null) return false;
    return token;
  }

  Future<void> deleteToken() async {
    _storage = await SharedPreferences.getInstance();

    await _storage!.remove('token');
  }

  Future<void> addToken(String token) async {
    _storage = await SharedPreferences.getInstance();

    await _storage!.setString('token', token);
  }

  Future<void> logout() async {
    await deleteToken();
  }

  Future<User?> login() async {
    load = true;
    final value = await rest.login(
        email: controllers[0].text, password: controllers[1].text);
    resetForm();
    load = false;
    return value;
  }

  Future<User?> signup() async {
    load = true;
    Map<String, dynamic>? user = User(
            name: controllers[2].text + ' ' + controllers[3].text,
            email: controllers[4].text,
            password: controllers[5].text)
        .toJson();

    final value = await rest.registerUser(data: user);
    resetForm();
    load = false;
    user = null;

    return value;
  }

  setCheckbox(value) {
    checkbox = value;

    notifyListeners();
  }

  set load(value) {
    loading = value;
    notifyListeners();
  }

  void resetForm() {
    for (var i = 0; i < 7; i++) {
      validators[i]['value'] = false;
      controllers[i].text = '';
    }
    checkbox = false;
    notifyListeners();
  }

  bool validateForm(start, end) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    bool value = true;
    for (var i = start; i < end; i++) {
      if (controllers[i].text.isEmpty) {
        validators[i]['value'] = true;
        value = false;
      } else if (i == 6 && controllers[i - 1].text != controllers[i].text) {
        validators[i]['value'] = true;
      } else if (regex.hasMatch(controllers[4].text) == false && start != 0) {
        validators[4]['value'] = true;
        value = false;
      } else {
        validators[i]['value'] = false;
      }
    }
    notifyListeners();
    return value;
  }
}
