import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../blocs/auth/auth_bloc.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildHome(BuildContext context, List<Object?> shoes) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomArrivalsContainer(),
        const SizedBox(height: 14),
        const Text(
          "New Arrivals",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ShoeModel.shoes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // child: Image.network(ShoeModel.shoes[index].pictureUrl),
                    child: Text(shoes[index].toString()),
                  ),
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            "Most Popular",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: MasonryGridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: ShoeModel.shoes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(ShoeModel.shoes[index].pictureUrlCandid),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
