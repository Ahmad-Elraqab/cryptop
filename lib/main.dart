import 'package:cryptop/app/const.dart';
import 'package:flutter/material.dart';
import 'package:cryptop/app/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cryptop/app/dependency.dart' as dep;

void main() {
  dep.init();
  RouteManager.setup("*");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppView());
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: const Color.fromRGBO(55, 61, 76, 1),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
          ),
        ),
        onGenerateRoute: RouteManager.generateRoute,
        initialRoute: rInti,
      ),
    );
  }
}
