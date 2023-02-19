import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CustomArrivalsContainer extends StatelessWidget {
  const CustomArrivalsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0),
      padding: const EdgeInsets.all(8.0),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 10.0), // shadow direction: bottom right
          )
        ],
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.black54,
            Colors.black12,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'New Arrivals',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white70),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Reebok',
              style: kHorizonTextStyleBold,
            ),
          ),
        ],
      ),
    );
  }
}
