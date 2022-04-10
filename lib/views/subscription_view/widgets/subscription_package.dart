import 'package:cryptop/views/subscription_view/widgets/subscription_package_back.dart';
import 'package:cryptop/views/subscription_view/widgets/subscription_package_front.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class SubscriptionPackage extends StatelessWidget {
  const SubscriptionPackage({
    Key? key,
    this.color,
    this.onChoose,
    this.onUpgrade,
    this.onCancel,
    this.package,
  }) : super(key: key);
  final Color? color;
  final Map? package;
  final Function? onChoose;
  final Function? onUpgrade;
  final Function? onCancel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0.0,
            margin: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
            color: const Color(0x00000000),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              speed: 1000,
              onFlipDone: (status) {
                // print(status);
              },
              front: SubscriptionPackageFront(package: package),
              back: SubscriptionPackageBack(package: package),
            ),
          ),
        ),
      ],
    );
  }
}
