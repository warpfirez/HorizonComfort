import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:horizon_comfort/blocs/auth/auth_bloc.dart';
import 'package:horizon_comfort/blocs/shoe/shoe_bloc.dart';
import 'package:horizon_comfort/cubits/cart/cart_cubit.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/cubits/home/home_cubit.dart';
import 'package:horizon_comfort/cubits/login/login_cubit.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/cubits/profile/profile_cubit.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/cubits/register/register_cubit.dart';
import 'package:horizon_comfort/config/app_navigator.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/search/search_cubit.dart';

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
        RepositoryProvider(create: (create) => DatabaseRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(create: (context) => ShoeBloc()),
          BlocProvider(
              create: (context) => FavouritesCubit(
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => HomeCubit(
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => CartCubit(
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => RegisterCubit(
                    authRepository: context.read<AuthRepository>(),
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => ProfileCubit(
                    authRepository: context.read<AuthRepository>(),
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => LoginCubit(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => MenuCubit(
                    settingsRepository: context.read<DatabaseRepository>(),
                  )),
          BlocProvider(
              create: (context) => SearchCubit(
                    databaseRepository: context.read<DatabaseRepository>(),
                  )),
        ],
        child: GetMaterialApp(
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
