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
import 'package:cryptop/views/subscription_view/subscription_view.dart';
import 'package:cryptop/views/wallet_view/wallet_view.dart';
import 'package:flutter/material.dart';
import '../app.dart';
import '../views/login_view/login_view.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case rLanding:
        builder = (BuildContext context) => App();
        break;
      case rTrade:
        builder = (BuildContext context) => App(currentIndex: '2');
        break;
      case rLoginScreen:
        builder = (BuildContext context) => const LoginView();
        break;
      case rRegisterScreen:
        builder = (BuildContext context) => const RegisterScreen();
        break;
      case rProfileScreen:
        builder = (BuildContext context) => const ProfileView();
        break;
      case rAcountInformation:
        builder = (BuildContext context) => const AccountInformationView();
        break;
      case rAcountPassword:
        builder = (BuildContext context) => const AccountPasswordView();
        break;
      case rNotifications:
        builder = (BuildContext context) => const NotificationView();
        break;
      case rLanguages:
        builder = (BuildContext context) => const LanguageView();
        break;
      case rAddress:
        builder = (BuildContext context) => const AddressView();
        break;
      case rPayment:
        builder = (BuildContext context) => const PaymentView();
        break;
      case rSearch:
        builder = (BuildContext context) => const SearchView();
        break;
      case rCoin:
        builder = (BuildContext context) => const CoinView();
        break;
      case rOrderbook:
        builder = (BuildContext context) => const OrderbookView();
        break;
      case rWallet:
        builder = (BuildContext context) => const WalletView();
        break;
      case rBacktest:
        builder = (BuildContext context) => const BacktestView();
        break;
      case rBacktestResults:
        builder = (BuildContext context) => const BacktestResult();
        break;
      case rSmartTrade:
        builder = (BuildContext context) => const SmartTradeView();
        break;
      case rAlert:
        builder = (BuildContext context) => const AlertView();
        break;
      case rSubscriptions:
        builder = (BuildContext context) => const SubscriptionView();
        break;

      default:
        builder = (BuildContext context) => App(currentIndex: settings.name!);
      // builder = (BuildContext context) => Container();
    }

    // throw Exception('Invalid route: ${settings.name}');

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
