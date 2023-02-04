import 'package:flutter/material.dart';
import 'package:horizon_comfort/config/app_navigator.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/login_screen.dart';
import 'package:horizon_comfort/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  initializeDefault();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.teal[900]),
      home: const RegisterScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      initialRoute: RegisterScreen.routeName,
    );
  }
}

Future<void> initializeDefault() async {
  /**
   WidgetFlutterBinding is used to interact with the Flutter engine.
   Firebase.initializeApp() needs to call native code to initialize Firebase,
   and since the plugin needs to use platform channels to call
   the native code, which is done asynchronously therefore
   ensureInitialized() is called to make sure that theres an instance
   of the WidgetsBinding.*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
