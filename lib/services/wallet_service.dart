import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/services/rest_service..dart';

class WalletService {
  RestService get rest => dependency();

  Future getWallet() async {
    final wallet = await rest.get('wallet/');

    return wallet;
  }

  Future setWallet(Map<String, dynamic> data) async {
    final wallet = await rest.patch('wallet/', data: data);

    return wallet;
  }
}
