import 'dart:async';
import 'package:cryptop/app/const.dart';
import 'package:cryptop/services/socket_service.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        SocketService.connectAndListen();
        final token = await context.read(userViewmodel).readToken();
        // print(token);
        if (token == false) {
          Navigator.pushReplacementNamed(context, rLoginScreen);
        } else {
          Navigator.pushReplacementNamed(context, rLanding);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(55, 61, 76, 1),
      body: Center(
        child: SizedBox(
          height: 150.0,
          width: 150.0,
          child: RiveAnimation.asset('lib/assets/loading.riv'),
        ),
      ),
    );
  }
}
