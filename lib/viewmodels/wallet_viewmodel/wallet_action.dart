import 'package:cryptop/models/wallet_model.dart';
import 'package:cryptop/viewmodels/wallet_viewmodel/wallet_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletViewmodel = ChangeNotifierProvider((ref) => WalletViewmodel());

final getWallet = FutureProvider.autoDispose<Wallet?>(
  (ref) async {
    final wallet = ref.watch(walletViewmodel);

    final result = await wallet.getWallet();

    return result;
  },
);

final setWallet = FutureProviderFamily<Wallet?, Map<String, dynamic>>(
  (ref, data) async {
    final wallet = ref.watch(walletViewmodel);

    final result = await wallet.setWallet(data);

    return result;
  },
);
