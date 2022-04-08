import 'package:cryptop/app/const.dart';
import 'package:flutter/material.dart';
import 'package:cryptop/app/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppView());
}

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     Future.delayed(
//       const Duration(seconds: 5),
//       () async => setState(() => AppView()),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             child: const Text('hi'),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
          backgroundColor: const Color.fromRGBO(55, 61, 76, 1),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
          ),
        ),
        onGenerateRoute: RouteManager.generateRoute,
        initialRoute: rSmartTrade,
      ),
    );
  }
}
