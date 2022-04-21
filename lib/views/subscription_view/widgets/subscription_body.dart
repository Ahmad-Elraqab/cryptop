import 'package:cryptop/views/subscription_view/widgets/subscription_package.dart';
import 'package:flutter/material.dart';

import '../../../components/title_header/title_header.dart';
import 'new_subscription.dart';

class SubscriptionBody extends StatelessWidget {
  const SubscriptionBody(
      {Key? key, this.packages, this.onCancel, this.onUpgrade, this.onChoose})
      : super(key: key);

  final List<Map>? packages;
  final Function? onCancel;
  final Function? onUpgrade;
  final Function? onChoose;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        const TitleHeader(isTitle: true, title: 'Subscriptions'),
        const SizedBox(height: 30.0),
        const NewSubscription(),
        const SizedBox(height: 30.0),
        for (var pack in packages!)
          SubscriptionPackage(
            color: pack['color'],
            onChoose: onChoose,
            package: pack,
            onUpgrade: onUpgrade,
            onCancel: onCancel,
          ),
      ],
    );
  }
}
