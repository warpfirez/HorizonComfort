import 'package:flutter/material.dart';
import 'package:horizon_comfort/screens/login_screen.dart';
import 'package:horizon_comfort/screens/register_screen.dart';

class AppNavigator {
  /// static so the method can be called without creating an object
  static Route generateRoute(RouteSettings settings) {
    print("Current route: ${settings.name}");

    switch (settings.name) {
      case '/':
        return RegisterScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const ErrorRoute(),
      settings: const RouteSettings(name: '/error'),
    );
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
    );
  }
}
