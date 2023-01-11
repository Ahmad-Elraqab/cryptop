import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    this.drawer,
  }) : super(key: key);

  final Function? drawer;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(55, 61, 76, 1),
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: Scaffold.of(context).openDrawer,
            child: SizedBox(
              height: 24.0,
              child: Image.asset(
                'lib/assets/menu.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            child: Image.asset(
              'lib/assets/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 24.0,
            child: Image.asset(
              'lib/assets/notification.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
