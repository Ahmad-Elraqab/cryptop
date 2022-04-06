import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'icon': 'lib/assets/market-b.png',
        'title': 'Market',
      },
      {
        'icon': 'lib/assets/trades-b.png',
        'title': 'Trade',
      },
      {
        'icon': 'lib/assets/orderbook-b.png',
        'title': 'Orderbook',
      },
      {
        'icon': 'lib/assets/wallet-b.png',
        'title': 'Wallet',
      },
      {
        'icon': 'lib/assets/profile-b.png',
        'title': 'Profile',
      },
      {
        'icon': 'lib/assets/smart-b.png',
        'title': 'Smart Trade',
      },
      {
        'icon': 'lib/assets/backtest-b.png',
        'title': 'Backtest',
      },
      {
        'icon': 'lib/assets/alert-b.png',
        'title': 'Alert',
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Container(
        width: 80.0,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < items.length; i++)
                      InkWell(
                        onTap: () => {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              items[i]['icon'].toString(),
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            TextComponent(
                              align: TextAlign.center,
                              fontSize: 9,
                              line: 1,
                              textColor: const Color.fromRGBO(55, 61, 76, 1),
                              title: items[i]['title'],
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: InkWell(
                onTap: () => {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/logout.png',
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const TextComponent(
                      align: TextAlign.center,
                      fontSize: 9,
                      line: 1,
                      textColor: Color.fromRGBO(55, 61, 76, 1),
                      title: 'Logout',
                      weight: FontWeight.w600,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
