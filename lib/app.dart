import 'package:cryptop/components/bottom_navigation/bottom_navigation.dart';
import 'package:cryptop/components/custom_drawer/custom_drawer.dart';
import 'package:cryptop/views/home_view/home_view.dart';
import 'package:cryptop/views/profile_view/profile_view.dart';
import 'package:cryptop/views/search_view/search_view.dart';
import 'package:cryptop/views/trade_view/trade_view.dart';
import 'package:cryptop/views/wallet_view/wallet_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  String currentIndex;
  String route;

  App({Key? key, this.currentIndex = "2", this.route = "/"}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: unused_element
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index.toString();
    });
  }

  callPage(index) {
    switch (index) {
      case "0":
        return const HomeView();
      case "1":
        return const SearchView();
      case "2":
        return TradeView(
          data: {'symbol': 'BTCUSDT'},
        );
      case "3":
        return const WalletView();
      case "4":
        return const ProfileView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      // drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 75,
          child: callPage(widget.currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.currentIndex,
        callBack: _onItemTapped,
      ),
    );
  }
}
