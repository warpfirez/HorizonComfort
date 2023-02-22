import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CustomArrivalsContainer extends StatelessWidget {
  const CustomArrivalsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kPastelYellow,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 10.0), // shadow direction: bottom right
          )
        ],
        // gradient: const LinearGradient(
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        //   colors: [
        //     //Color(0xFFAAD2BD),
        //     // Colors.deepPurple,
        //     Colors.black54,
        //     Colors.black87,
        //   ],
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Always tax free',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Horizon Comfort',
              style: kHorizonTextStyleBold.copyWith(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
