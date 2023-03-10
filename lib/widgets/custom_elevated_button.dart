import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final String? email;
  final String? password;
  final Size? minimumSize;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.email,
    this.password,
    this.minimumSize = const Size(250, 50),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(20),
        minimumSize: MaterialStateProperty.all(minimumSize),
        backgroundColor: MaterialStateProperty.all(Colors.black87),
        overlayColor: MaterialStateProperty.all(kPastelGreen),
        shadowColor: MaterialStateProperty.all(Colors.brown[900]),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
