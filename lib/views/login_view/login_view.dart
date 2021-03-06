import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:cryptop/views/login_view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final labels = [
    'Username Or Email',
    'Password',
  ];

  onclick() async {
    final _userViewmodel = context.read(userViewmodel);

    bool value = _userViewmodel.validateForm(0, 2);

    if (value) {
      final user = await context.read(userViewmodel).login();
      if (user is User) {
        ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
        Navigator.pushReplacementNamed(context, '/landing');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar('Invalid email or password!'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 61, 76, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: Consumer(
            builder: (context, watch, child) {
              final loading = watch(userViewmodel).load;
              return LoginBody(
                labels: labels,
                loading: loading,
                onclick: onclick,
              );
            },
          ),
        ),
      ),
    );
  }
}
