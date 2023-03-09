import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomGalleryButton extends StatelessWidget {
  final Function()? myFunction;
  final String text;
  const CustomGalleryButton({super.key, this.myFunction, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myFunction,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Text(
          text,
          style: kTypewriterTitleBoldTextStyle,
        ),
      ),
    );
  }
}
