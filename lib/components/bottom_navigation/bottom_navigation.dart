import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final String? currentIndex;
  final Function? callBack;

  const BottomNavBar({Key? key, this.currentIndex, this.callBack})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String? activeIndex = '0';
  final items = [
    {
      'icon': 'lib/assets/home-n.png',
      'icon-a': 'lib/assets/home-a.png',
      'title': 'Home',
    },
    {
      'icon': 'lib/assets/market-n.png',
      'icon-a': 'lib/assets/market-a.png',
      'title': 'Market',
    },
    {
      'icon': 'lib/assets/trade-n.png',
      'icon-a': 'lib/assets/trade-a.png',
      'title': 'Trade',
    },
    {
      'icon': 'lib/assets/wallet-n.png',
      'icon-a': 'lib/assets/wallet-a.png',
      'title': 'Wallet',
    },
    {
      'icon': 'lib/assets/profile-n.png',
      'icon-a': 'lib/assets/profile-a.png',
      'title': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(55, 61, 76, 1),
      height: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Divider(
            thickness: 2,
            color: Colors.white,
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < items.length; i++)
                  InkWell(
                    onTap: () => {widget.callBack!(i)},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          i.toString() == widget.currentIndex!
                              ? items[i]['icon-a'].toString()
                              : items[i]['icon'].toString(),
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextComponent(
                          align: TextAlign.center,
                          fontSize: 9,
                          line: 1,
                          textColor: widget.currentIndex! == i.toString()
                              ? Colors.amberAccent
                              : Colors.white,
                          title: items[i]['title'],
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
