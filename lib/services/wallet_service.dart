import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/wallet_model.dart';
import 'package:cryptop/services/rest_service..dart';

class WalletService {
  RestService get rest => dependency();

  Future<Wallet?> getWallet() async {
    final json = await rest.get('wallet/');

    if (json == null) return null;

    return Wallet.fromJson(json);
  }

  Future setWallet(Map<String, dynamic> data) async {
    final wallet = await rest.patch('wallet/', data: data);

    return wallet;
  }
}
