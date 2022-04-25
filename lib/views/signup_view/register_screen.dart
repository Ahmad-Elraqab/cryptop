import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/views/signup_view/widgets/registeration_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/user_viewmodel/user_action.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final labels = [
    'First Name',
    'Last Name',
    'Email',
    'Password',
    'Repeat Password'
  ];

  onclick() async {
    final _userViewmodel = context.read(userViewmodel);

    bool value =
        _userViewmodel.validateForm(2, _userViewmodel.controllers.length);

    if (value) {
      if (_userViewmodel.checkbox == true) {
        final user = await context.read(userViewmodel).signup();
        if (user is User) {
          await _userViewmodel.addToken(user.token!);

          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('Registered sucessfully!'));
          Navigator.pushReplacementNamed(context, '/landing');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('Email aleady exist!'));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar('Agree on Terms & Conditions'));
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
          child: SingleChildScrollView(
            child: Consumer(builder: (context, watch, child) {
              final loading = watch(userViewmodel).load;
              return RegisterationBody(
                labels: labels,
                loading: loading,
                onclick: onclick,
              );
            }),
          ),
        ),
      ),
    );
  }
}
