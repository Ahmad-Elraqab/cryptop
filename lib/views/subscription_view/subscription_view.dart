import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/subscription_view/widgets/new_subscription.dart';
import 'package:cryptop/views/subscription_view/widgets/subscription_package.dart';
import 'package:flutter/material.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  State<SubscriptionView> createState() => SsubscriptionStateView();
}

class SsubscriptionStateView extends State<SubscriptionView> {
  bool isSubscriped = false;
  onChoose() => {};
  onCancel() => {};
  onUpgrade() => {};

  final List<Map> packages = [
    {
      'name': '1 Month Pack',
      'price': '29.99\$',
      'access': [
        'Alerts',
        'Smart Trade',
        'Backtest',
      ],
      'isSub': false,
      'end_date': 'Ends on 10-5-2022',
      'color': const Color.fromARGB(255, 31, 125, 153)
    },
    {
      'name': '1 Month Pack',
      'price': '29.99\$',
      'access': [
        'Alerts',
        'Smart Trade',
        'Backtest',
      ],
      'isSub': false,
      'end_date': 'Ends on 10-5-2022',
      'color': const Color.fromARGB(255, 31, 125, 153)
    },
    {
      'name': '6 Month Pack',
      'price': '99.99\$',
      'access': [
        'Alerts',
        'Smart Trade',
        'Backtest',
      ],
      'isSub': true,
      'end_date': 'Ends on 10-5-2022',
      'color': const Color.fromARGB(255, 118, 121, 33)
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(55, 61, 76, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const TitleHeader(isTitle: true, title: 'Subscriptions'),
              const SizedBox(height: 30.0),
              const NewSubscription(),
              const SizedBox(height: 30.0),
              for (var pack in packages)
                SubscriptionPackage(
                  color: pack['color'],
                  onChoose: onChoose,
                  package: pack,
                  onUpgrade: onUpgrade,
                  onCancel: onCancel,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
