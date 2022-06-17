import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final routes = [
      rUserListScreen,
      rUserListScreen,
      rUserListScreen,
      rUserListScreen,
    ];
    final routesName = [
      'Users Controller',
      'SmartTrade Controller',
      'Subscriptions Controller',
      'System Wallet',
    ];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(55, 61, 76, 1),
        child: Column(
          children: [
            TitleHeader(isTitle: true, title: 'Dashboard'),
            SizedBox(height: 50),
            for (int i = 0; i < routes.length; i++)
              InkWell(
                onTap: () => Navigator.pushNamed(context, routes[i]),
                child: Container(
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: Card(
                    color: Color.fromARGB(185, 86, 92, 107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 11,
                    shadowColor: Color.fromARGB(195, 87, 93, 109),
                    child: Center(
                      child: TextComponent(
                        align: TextAlign.center,
                        fontSize: 12.0,
                        line: 1,
                        textColor: Colors.white,
                        title: routesName[i],
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
