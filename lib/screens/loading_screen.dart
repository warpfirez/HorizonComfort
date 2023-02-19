import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildLoading(BuildContext context) {
  return Container(
    height: double.infinity,
    color: Colors.black87,
    child: Lottie.asset(
      'animations/loading_animation.json',
      repeat: true,
      reverse: false,
      frameRate: FrameRate(90),
      fit: BoxFit.contain,
    ),
  );
}
