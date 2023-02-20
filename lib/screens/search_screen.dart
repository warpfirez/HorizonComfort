import 'package:flutter/material.dart';

import '../widgets/custom_arrivals_container.dart';

Widget buildSearch(BuildContext context, String searchData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const CustomArrivalsContainer(),
      Text(searchData),
      Text(searchData),
      Text(searchData),
    ],
  );
}
