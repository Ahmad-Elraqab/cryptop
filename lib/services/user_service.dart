import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/services/rest_service..dart';

class UserService {
  RestService get rest => dependency();

  Future<User?> login({String? email, String? password}) async {
    final json =
        await rest.post('users/login', {'email': email, 'password': password});
    if (json == null || json.length == 0) return null;

    final _user = User.fromJson(json);

    return _user;
  }

  Future<User?> registerUser({Map<String, dynamic>? data}) async {
    final json = await rest.post('users/', data!);
    if (json == null || json.length == 0) return null;

    final _user = User.fromJson(json);
    return _user;
  }
}
