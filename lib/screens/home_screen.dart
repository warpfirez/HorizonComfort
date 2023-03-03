import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';

import '../blocs/auth/auth_bloc.dart';
import '../utilities/constants.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildHome(BuildContext context, List<ShoeModel> shoes) {
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
          style: kTypewriterTitleBoldTextStyle,
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ShoeModel.shoes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(shoes[index].galleryUrl!['0']!),
                      //child: Text(shoes[index].toString()),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeScreen(
                                  shoe: shoes[index],
                                )));
                  },
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            "Most Popular",
            style: kTypewriterTitleBoldTextStyle,
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoeScreen(
                                shoe: shoes[index],
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(shoes[index].pictureUrlCandid!),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
