import 'dart:async';

import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class UserViewmodel extends ChangeNotifier {
  User? user;
  UserService get rest => dependency();

  bool loading = false;

  bool get load => loading;
  set load(value) {
    loading = value;
    notifyListeners();
  }

  Future<User?> login(email, password) async {
    load = true;
    final value = await rest.login(email: email, password: password);
    load = false;
    return value;
  }
}
