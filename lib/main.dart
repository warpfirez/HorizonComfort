import 'package:flutter/material.dart';
import 'package:horizon_comfort/blocs/auth/auth_bloc.dart';
import 'cubits/register/register_cubit.dart';
import 'package:horizon_comfort/config/app_navigator.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/login_screen.dart';
import 'package:horizon_comfort/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.teal[900]),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (create) => AuthRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthBloc(
                      authRepository: context.read<AuthRepository>(),
                      child: null,
                    )),
            BlocProvider(
                create: (context) => RegisterCubit(
                      authRepository: context.read<AuthRepository>(),
                    )),
          ],
          child: const RegisterScreen(),
        ),
      ),
      //  onGenerateRoute: AppNavigator.onGenerateRoute,
      // initialRoute: RegisterScreen.routeName,
    );
  }
}
