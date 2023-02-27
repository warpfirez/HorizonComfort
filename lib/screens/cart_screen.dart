import 'package:flutter/material.dart';

import '../widgets/custom_arrivals_container.dart';

Widget buildCart(BuildContext context, String cartData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(cartData),
      Text(cartData),
      Text(cartData),
    ],
  );
}
