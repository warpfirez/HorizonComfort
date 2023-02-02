import 'package:flutter/material.dart';
import 'package:horizon_comfort/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.teal[900]),
      home: const HomeScreen(),
    );
  }
}
