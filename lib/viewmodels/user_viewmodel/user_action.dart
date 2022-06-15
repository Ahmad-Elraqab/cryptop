import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userViewmodel = ChangeNotifierProvider((ref) => UserViewmodel());

final getUsersAction = FutureProvider<List<User>?>(
  (ref) async {
    final user = ref.watch(userViewmodel);

    final result = await user.getAllUsers();

    return result;
  },
);
