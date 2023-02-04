import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const String routeName = 'LoadingScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LoadingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Lottie.asset(
        'animations/loading_animation.json',
        repeat: true,
        reverse: true,
        frameRate: FrameRate(144),
        fit: BoxFit.contain,
      ),
    );
  }
}
