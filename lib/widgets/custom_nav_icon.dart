import 'package:flutter/material.dart';

class CustomNavIcon extends StatelessWidget {
  final IconData icon;
  const CustomNavIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(icon, size: 35, color: Colors.white),
    );
  }
}
