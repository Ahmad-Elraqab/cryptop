import 'package:cryptop/services/rest_service..dart';
import 'package:cryptop/services/user_service.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton<RestService>(
    () => const RestService(
        // baseUrl: 'http://localhost:5000/cryptop/api/'),
        baseUrl: 'http://10.0.2.2:5000/cryptop/api'),
    // () => RestService(baseUrl: 'http://localhost:5000'),
  );

  dependency.registerLazySingleton(() => UserViewmodel());
  dependency.registerLazySingleton(() => UserService());
}
