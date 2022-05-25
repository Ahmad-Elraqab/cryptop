import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/services/rest_service..dart';

class OrderService {
  RestService get rest => dependency();

  Future getOpenOrders() async {}

  Future getHistoricalOrders() async {}

  Future createOrder() async {}

  Future closeOrder() async {}

  Future getTicker() async {}
}
