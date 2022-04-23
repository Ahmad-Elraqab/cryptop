import 'package:cryptop/viewmodels/user_viewmodel/user_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model.dart';

final userViewmodel = ChangeNotifierProvider((ref) => UserViewmodel());

final loginAction = FutureProvider.family<User?, Map>(
  (ref, details) async {
    final user = ref.watch(userViewmodel);

    final result = await user.login(details['email'], details['password']);

    return result;
  },
);
