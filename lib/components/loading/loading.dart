import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: RiveAnimation.asset('lib/assets/loading.riv'),
      ),
    );
  }
}
