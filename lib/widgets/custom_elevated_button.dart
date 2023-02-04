import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final String? email;
  final String? password;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.email,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(20),
        minimumSize: MaterialStateProperty.all(const Size(250, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.black87),
        overlayColor: MaterialStateProperty.all(Colors.teal[900]),
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
