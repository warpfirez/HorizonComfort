import 'package:flutter/material.dart';
import 'package:horizon_comfort/blocs/auth/auth_bloc.dart';
import 'package:horizon_comfort/cubits/login/login_cubit.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/data/home_repository.dart';
import 'package:horizon_comfort/data/search_repository.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/screens/menu_screen.dart';
import 'package:horizon_comfort/screens/register_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'cubits/register/register_cubit.dart';
import 'package:horizon_comfort/config/app_navigator.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/screens/login_screen.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (create) => AuthRepository()),
        RepositoryProvider(create: (create) => HomeRepository()),
        RepositoryProvider(create: (create) => SearchRepository()),
        RepositoryProvider(create: (create) => DatabaseRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => RegisterCubit(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => LoginCubit(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => MenuCubit(
                    homeRepository: context.read<HomeRepository>(),
                    searchRepository: context.read<SearchRepository>(),
                    settingsRepository: context.read<DatabaseRepository>(),
                  )),
        ],
        child: MaterialApp(
          theme: ThemeData(
            canvasColor: kBackgroundColor,
            brightness: Brightness.light,
          ),
          home: const LoginScreen(),
          onGenerateRoute: AppNavigator.onGenerateRoute,
          initialRoute: LoginScreen.routeName,
        ),
      ),
    );
  }
}
