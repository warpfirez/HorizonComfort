import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../utilities/constants.dart';
import '../widgets/custom_nav_icon.dart';
import '../widgets/custon_arrivals_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'HomeScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _page = 0;
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
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
          _page = index;
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CustomArrivalsContainer(),
            Text('data'),
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
