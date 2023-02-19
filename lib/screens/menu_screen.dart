import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/screens/search_screen.dart';
import 'package:lottie/lottie.dart';

import '../utilities/constants.dart';
import '../widgets/custom_nav_icon.dart';
import '../widgets/custom_arrivals_container.dart';
import 'home_screen.dart';
import 'loading_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const String routeName = 'HomeScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const MenuScreen(),
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
        color: Colors.black54,
        buttonBackgroundColor: Colors.black54,
        backgroundColor: kBackgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          final pagesCubit = BlocProvider.of<MenuCubit>(context);
          print(index);

          switch (index) {
            case 0:
              {
                pagesCubit.getHomePage('dymy');
              }
              break;
            case 1:
              {
                pagesCubit.getSearchPage('dymy');
              }
              break;
          }
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
          child: BlocConsumer<MenuCubit, PagesState>(
        listener: (context, state) {
          if (state is PagesError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is PagesInitial) {
            return buildHome("test");
          } else if (state is PagesLoading) {
            return buildLoading(context);
          } else if (state is PagesHome) {
            return buildHome('home page');
          } else if (state is PagesSearch) {
            return buildSearch('search page');
          } else {
            return buildHome('home page');
          }
        },
      )),
    );
  }
}
