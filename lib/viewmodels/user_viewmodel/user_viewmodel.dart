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
  ];

  setValidator(index, value) {
    validators[index]['value'] = value;
    notifyListeners();
  }

  bool checkbox = false;

  setCheckbox(value) {
    checkbox = value;
    notifyListeners();
  }

  final List<TextEditingController> controllers =
      List.generate(2, (i) => TextEditingController());

  bool get load => loading;
  set load(value) {
    loading = value;
    notifyListeners();
  }

  Future<User?> login() async {
    validators[0]['value'] = false;
    validators[1]['value'] = false;
    load = true;
    final value = await rest.login(
        email: controllers[0].text, password: controllers[1].text);
    load = false;
    return value;
  }
}
