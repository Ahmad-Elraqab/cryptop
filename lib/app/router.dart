import 'package:cryptop/app/const.dart';
import 'package:cryptop/views/account_information_view/account_information_view.dart';
import 'package:cryptop/views/account_passwrod_view/account_password_view.dart';
import 'package:cryptop/views/address_view/address_view.dart';
import 'package:cryptop/views/admin_views/dashboard_view/dashboard_view.dart';
import 'package:cryptop/views/admin_views/smart_trade_admin_view/smart_trade_admin_view.dart';
import 'package:cryptop/views/admin_views/user_list_view/user_list_view.dart';
import 'package:cryptop/views/admin_views/user_view/user_view.dart';
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
  static final initRoutes = [
    rSplash,
    rLoginScreen,
    rRegisterScreen,
    rLanding,
    rInti,
  ];
  static final routes = [
    rTrade,
    rProfileScreen,
    rAcountInformation,
    rAcountPassword,
    rNotifications,
    rLanguages,
    rAddress,
    rPayment,
    rSearch,
    rCoin,
    rOrderbook,
    rWallet,
    rBacktest,
    rBacktestResults,
    rSmartTrade,
    rAlert,
    rSubscriptions
  ];
  static final adminRoutes = [
    rUserListScreen,
    rUserView,
    rDashboard,
    rSmartTradeAdmin,
  ];
  static String? role = '*';
  static void setup(user) {
    debugPrint(user);
    role = user;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;

    switch (settings.name) {
      case rInti:
        builder = const SplashView();
        break;
      case rSplash:
        builder = const SplashView();
        break;
      case rLanding:
        builder = App(currentIndex: '0');
        break;
      case rTrade:
        builder = TradeView(
          data: settings.arguments!,
        );
        break;
      case rLoginScreen:
        builder = const LoginView();
        break;
      case rSmartTradeAdmin:
        builder = const SmartTradeAdminView();
        break;
      case rRegisterScreen:
        builder = const RegisterScreen();
        break;
      case rProfileScreen:
        builder = const ProfileView();
        break;
      case rUserListScreen:
        builder = const UserListView();
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
        builder = CoinView();
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
        builder = BacktestResult(
          data: settings.arguments!,
        );
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
      case rDashboard:
        builder = const DashboardView();
        break;
      case rUserView:
        builder = UserView(
          data: settings.arguments!,
        );
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    print(role);
    print(settings.name);
    switch (role) {
      case '*':
        if (initRoutes.contains(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder,
            settings: settings,
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 200),
          );
        }
        break;
      case 'trader':
        if (routes.contains(settings.name) ||
            initRoutes.contains(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder,
            settings: settings,
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 200),
          );
        }
        break;
      case 'admin':
        if (routes.contains(settings.name) ||
            initRoutes.contains(settings.name) ||
            adminRoutes.contains(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder,
            settings: settings,
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 200),
          );
        }
        break;
      default:
    }
    return MaterialPageRoute(
      builder: (context) => UnauthorizedPage(),
    );
  }
}

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unauthorized access')),
      body: Center(child: Text('you do not access this page...')),
    );
  }
}
