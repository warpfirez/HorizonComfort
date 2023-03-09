import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/screens/cart_screen.dart';
import 'package:horizon_comfort/screens/onboarding_screen.dart';
import 'package:horizon_comfort/screens/search_screen.dart';
import 'package:horizon_comfort/screens/settings_screen.dart';
import 'package:horizon_comfort/blocs/auth/auth_bloc.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_nav_icon.dart';
import 'package:horizon_comfort/screens/home_screen.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/login_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const String routeName = 'HomeScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const LoginScreen()
            : const MenuScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

  //  BlocListener<AuthBloc, AuthState>(listener: (context, state) {
  // if (state.status == AuthStatus.authenticated) {
  //  const LoginScreen();
  // }

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          CustomNavIcon(icon: Icons.home),
          CustomNavIcon(icon: Icons.search),
          CustomNavIcon(icon: Icons.shopping_cart),
          CustomNavIcon(icon: Icons.favorite),
          CustomNavIcon(icon: Icons.person),
        ],
        color: Colors.black87,
        buttonBackgroundColor: Colors.black87,
        backgroundColor: kBackgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          final menuCubit = BlocProvider.of<MenuCubit>(context);
          print(index);

          switch (index) {
            case 0:
              {
                menuCubit.getHomeScreen();
              }
              break;
            case 1:
              {
                menuCubit.getSearchScreen('dymy');
              }
              break;
            case 2:
              {
                menuCubit.getCartScreen();
              }
              break;
            case 4:
              {
                menuCubit.getSettingsScreen();
              }
              break;
          }
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.of(context).pushReplacementNamed(
              LoginScreen.routeName,
            );
          }
        },
        child: BlocConsumer<MenuCubit, MenuState>(
          listener: (context, state) {
            if (state is MenuError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is MenuInitial) {
              return const BuildOnboarding();
            } else if (state is MenuLoading) {
              return const BuildLoading();
            } else if (state is MenuHome) {
              return BuildHome(shoes: state.shoes);
            } else if (state is MenuSearch) {
              return const BuildSearch();
            } else if (state is MenuCart) {
              return BuildCart(
                shoesInCart: state.shoesInCart,
                totalPrice: state.totalPrice,
              );
            } else if (state is MenuSettings) {
              return BuildSettings(user: state.user);
            } else {
              return const BuildLoading();
            }
          },
        ),
      )),
    );
  }
}
