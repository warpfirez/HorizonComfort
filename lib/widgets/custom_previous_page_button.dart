import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomPreviousPageButton extends StatelessWidget {
  const CustomPreviousPageButton({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Text(
          "<",
          style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 36),
        ),
      ),
    );
  }
}
