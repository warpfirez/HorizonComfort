import 'package:flutter/material.dart';

import '../widgets/custom_arrivals_container.dart';

Widget buildHome(String homeData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const CustomArrivalsContainer(),
      Text(homeData),
      Text(homeData),
      Text(homeData),
    ],
  );
}
