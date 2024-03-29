import 'package:cryptop/services/alert_rest_service.dart';
import 'package:cryptop/services/alert_service.dart';
import 'package:cryptop/services/backtest_service.dart';
import 'package:cryptop/services/chart_service.dart';
import 'package:cryptop/services/notification_service.dart';
import 'package:cryptop/services/order_service.dart';
import 'package:cryptop/services/rest_service..dart';
import 'package:cryptop/services/smart_trade_service.dart';
import 'package:cryptop/services/user_service.dart';
import 'package:cryptop/services/wallet_service.dart';
import 'package:cryptop/services/web_socket_serviec.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton<RestService>(
    () => const RestService(
        // baseUrl: 'http://127.0.0.1:3000/cryptop/api'),
        // baseUrl: 'http://10.0.2.2:3000/cryptop/api'),
        baseUrl: 'https://cryptop-service.onrender.com/cryptop/api'),
    // () => RestService(
    // baseUrl: 'http://localhost:3000/cryptop/api'),
  );
  dependency.registerLazySingleton<AlertRestService>(
    () => const AlertRestService(
        // baseUrl: 'http://localhost:3000/cryptop/api'),
        // baseUrl: 'http://10.0.2.2:3000/cryptop/api'),
        baseUrl: 'https://cryptop-service.onrender.com/cryptop/api'),
    // () => RestService(baseUrl: 'http://localhost:5000'),
  );

  dependency.registerLazySingleton(() => UserViewmodel());
  // dependency.registerLazySingleton(() => NotificationService());
  dependency.registerLazySingleton(() => AlertService());
  dependency.registerLazySingleton(() => WalletService());
  dependency.registerLazySingleton(() => UserService());
  dependency.registerLazySingleton(() => BacktestService());
  dependency.registerLazySingleton(() => ChartService());
  dependency.registerLazySingleton(() => SmartTradeService());
  dependency.registerLazySingleton(() => OrderService());
  dependency.registerLazySingleton(() => WebSocketService());
}
