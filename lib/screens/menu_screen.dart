import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/screens/cart_screen.dart';
import 'package:horizon_comfort/screens/search_screen.dart';
import 'package:horizon_comfort/screens/settings_screen.dart';
import 'package:lottie/lottie.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../data/models/user_model.dart';
import '../utilities/constants.dart';
import '../widgets/custom_nav_icon.dart';
import '../widgets/custom_arrivals_container.dart';
import 'home_screen.dart';
import 'loading_screen.dart';
import 'login_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const String routeName = 'HomeScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        // return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        //   if (state.status == AuthStatus.authenticated) {
        //     return const LoginScreen();
        //   } else {
        //     return const MenuScreen();
        //   }
        // });
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const LoginScreen()
            : const MenuScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

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
          child: BlocConsumer<MenuCubit, MenuState>(
        listener: (context, state) {
          if (state is MenuError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is MenuInitial) {
            return buildLoading(context);
          } else if (state is MenuLoading) {
            return buildLoading(context);
          } else if (state is MenuHome) {
            return buildHome(context, state.shoes);
          } else if (state is MenuSearch) {
            return buildSearch(context, 'search screen');
          } else if (state is MenuCart) {
            return buildCart(
                context, state.user, state.shoesInCart, state.totalPrice);
          } else if (state is MenuSettings) {
            return buildSettings(context, state.user);
          } else {
            return buildLoading(context);
          }
        },
      )),
    );
  }
}
