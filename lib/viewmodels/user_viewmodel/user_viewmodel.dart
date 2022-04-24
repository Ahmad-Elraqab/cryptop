import 'dart:async';

import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class UserViewmodel extends ChangeNotifier {
  User? user;
  UserService get rest => dependency();

  bool loading = false;

  final validators = [
    {'value': false, 'message': 'fill in email!'},
    {'value': false, 'message': 'fill in password!'},
    {'value': false, 'message': 'fill in first name'},
    {'value': false, 'message': 'fill in last name'},
    {'value': false, 'message': 'fill in email'},
    {'value': false, 'message': 'fill in password'},
    {'value': false, 'message': 'repeat password'},
  ];

  void resetForm() {
    for (var i = 0; i < 7; i++) {
      validators[i]['value'] = false;
      controllers[i].text = '';
    }
    checkbox = false;
    notifyListeners();
  }

  bool checkbox = false;

  setCheckbox(value) {
    checkbox = value;

    notifyListeners();
  }

  final List<TextEditingController> controllers =
      List.generate(7, (i) => TextEditingController());

  bool get load => loading;
  set load(value) {
    loading = value;
    notifyListeners();
  }

  bool validateForm(start, end) {
    bool value = true;
    for (var i = start; i < end; i++) {
      if (controllers[i].text.isEmpty) {
        validators[i]['value'] = true;
        value = false;
      } else if (i == 6 && controllers[i - 1].text != controllers[i].text) {
        validators[i]['value'] = true;
      } else {
        validators[i]['value'] = false;
      }
    }
    notifyListeners();
    return value;
  }

  Future<User?> login() async {
    validators.map((e) => e['value'] = false);
    load = true;
    final value = await rest.login(
        email: controllers[0].text, password: controllers[1].text);
    load = false;
    return value;
  }

  Future<User?> signup() async {
    validators.map((e) => e['value'] = false);
    load = true;
    Map<String, dynamic>? user = User(
            name: controllers[2].text + ' ' + controllers[3].text,
            email: controllers[3].text,
            password: controllers[4].text)
        .toJson();

    final value = await rest.registerUser(data: user);
    load = false;
    user = null;

    return value;
  }
}
