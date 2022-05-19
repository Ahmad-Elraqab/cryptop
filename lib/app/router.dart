import 'package:cryptop/app/const.dart';
import 'package:cryptop/views/account_information_view/account_information_view.dart';
import 'package:cryptop/views/account_passwrod_view/account_password_view.dart';
import 'package:cryptop/views/address_view/address_view.dart';
import 'package:cryptop/views/alert_view/alert_view.dart';
import 'package:cryptop/views/backtest_view/backtest_view.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_result.dart';
import 'package:cryptop/views/coin_view/coin_view.dart';
import 'package:cryptop/views/language_view/language_view.dart';
import 'package:cryptop/views/notification_view/notification_view.dart';
import 'package:cryptop/views/orderbook_view/orderbook_view.dart';
import 'package:cryptop/views/payment_view/payment_view.dart';
import 'package:cryptop/views/profile_view/profile_view.dart';
import 'package:cryptop/views/search_view/search_view.dart';
import 'package:cryptop/views/signup_view/register_screen.dart';
import 'package:cryptop/views/smart_trade_view/smart_trade_view.dart';
import 'package:cryptop/views/splash_view/splash_view.dart';
import 'package:cryptop/views/subscription_view/subscription_view.dart';
import 'package:cryptop/views/trade_view/trade_view.dart';
import 'package:cryptop/views/wallet_view/wallet_view.dart';
import 'package:flutter/material.dart';
import '../app.dart';
import '../views/login_view/login_view.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;

    switch (settings.name) {
      case rSplash:
        builder = const SplashView();
        break;
      case rLanding:
        builder = App(currentIndex: '0');
        break;
      case rTrade:
        builder = const TradeView();
        break;
      case rLoginScreen:
        builder = const LoginView();
        break;
      case rRegisterScreen:
        builder = const RegisterScreen();
        break;
      case rProfileScreen:
        builder = const ProfileView();
        break;
      case rAcountInformation:
        builder = const AccountInformationView();
        break;
      case rAcountPassword:
        builder = const AccountPasswordView();
        break;
      case rNotifications:
        builder = const NotificationView();
        break;
      case rLanguages:
        builder = const LanguageView();
        break;
      case rAddress:
        builder = const AddressView();
        break;
      case rPayment:
        builder = const PaymentView();
        break;
      case rSearch:
        builder = const SearchView();
        break;
      case rCoin:
        builder = CoinView(data: settings.arguments as String);
        break;
      case rOrderbook:
        builder = const OrderbookView();
        break;
      case rWallet:
        builder = const WalletView();
        break;
      case rBacktest:
        builder = const BacktestView();
        break;
      case rBacktestResults:
        builder = const BacktestResult();
        break;
      case rSmartTrade:
        builder = const SmartTradeView();
        break;
      case rAlert:
        builder = const AlertView();
        break;
      case rSubscriptions:
        builder = const SubscriptionView();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    // return MaterialPageRoute(
    //   builder: builder,
    //   settings: settings,
    // );
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder,
      settings: settings,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
