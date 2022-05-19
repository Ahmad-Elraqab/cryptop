import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200.0,
      child: Center(
        child: SizedBox(
            height: 70.0, child: RiveAnimation.asset('lib/assets/loading.riv')),
      ),
    );
  }
}
