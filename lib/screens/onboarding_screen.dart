import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/constants.dart';

Widget buildOnboarding() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Looking for custom shoes?',
            style: kTypewriterTitleBoldTextStyle, textAlign: TextAlign.center),
        Container(
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/OnboardingMenu.PNG"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const Text(
            'Choose from a wide variety of sizes, colors, and designs to make your perfect pair.',
            style: kTypewriterTextStyle,
            textAlign: TextAlign.center),
      ],
    ),
  );
}
